class Game < ActiveRecord::Base
  has_one :white_player, class_name: :user
  has_one :black_player, class_name: :user
  has_many :pieces

  after_create :populate_board!

  # scope :available, -> {
  # 	joins("LEFT OUTER JOIN users ON users.game_id = games.id").
  # 	group("games.id").
  # 	having("count(games.id) < 2")
  # }

  scope :available, -> { where('black_player_id IS NULL OR white_player_id IS NULL') }


  def check?
    !check_by.empty? ? (return true) : (return false) 
  end


  def check_by
    #Loop through every piece on the board except for the kings, and for each iteration, determine whether that piece can destroy the opponent's king
    # binding.pry
    check_by=[] 
    pieces.each do |piece|
      #this array stores the pieces that are checking the king
      binding.pry
      piece.color == 'black' ? (opponent_color=1) : (opponent_color=0) #set the opponent's color to be the opposite of the current piece color
      #retrieve the opponent's king x, y
      enemy_king = pieces.find_by(color: opponent_color, type: 'King')
      enemy_king_x = enemy_king.x
      enemy_king_y = enemy_king.y
      check_by<<piece if piece.valid_move?(enemy_king_x,enemy_king_y) #determine whether this piece threaten opponent's king
    end
    return check_by
  end

  def king_in_check
    if check?
      binding.pry
      check_by[0].color=='black' ? (king_color='white') : (king_color='black')
      return piece.where(type:'King', color:king_color)
    end
  end 

  def checkmate?
    
    #if a game is in check?(), iterate through every possible move King could make and determine if the game is still in check, return false if at least one move still return true on game.check?(). 
    x_coord_indices = { 'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8 }
    
    if check?
      #determine if king can get out of the check
      return false if get_out_of_check? || block_out_of_check? 
      return true
    end 
    false #if the game is not in check, there is no checkmate
  end


  def get_out_of_check?
    x = king_in_check.x
    y = king_in_check.y
    x_norm=x_coord_indices[x]


    #have a pointer to move the king one step in all directions
    times=0 #iterator
    ix = [0, 1, 1, 1, 0, -1, -1, -1]
    iy = [1, 1, 0, -1, -1, -1, 0, 1]
    index=0
    ix.each do |delta_x| #going clockwise starting from top center 
      
      delta_y = iy[index]
      
      dest_x=x_norm+delta_x if dest_x <= 8 && dest_x >=1
      dest_y=y+delta_y if dest_y <= 8 && dest_y >=1
      
      king.move!(dest_x, dest_y)
      if check?
        king.move!(x,y) #move king back and return false if king can't get out
        return false
      end
      king.move!(x,y) #move the piece back if not checkmate
      index+=1
    end

    return true
  end

  def block_out_of_check?
    x_coord_indices = { 'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8 }
    color=king_in_check.color
    rescue_team=pieces.where(color:color)
    check_by.each do |offender_piece|
      pointer = offender_piece #reset pointer to point to the offender piece
      rescue_team.each do |rescue_piece|
        # return true if rescue_piece.valid_move?(offender_piece.x, offender_piece.y)
        case offender_piece.type
        when 'Knight'
          #do nothing
        when 'Queen', 'Rook', 'Bishop', 'Pawn'
          (x_coord_indices[offender_piece.x]-x_coord_indices[king_in_check.x])>0 ? (x_direction=-1) : (x_direction=1)
          (offender_piece.y-king_in_check.y)>0 ? (y_direction=-1) : (y_direction=1)
          while pointer.x!=king_in_check.x || pointer.y!=king_in_check.y
            return true if rescue_piece.valid_move?(pointer.x, pointer.y)
            pointer.x+=direction if pointer.x!=king_in_check.x
            pointer.y+=direction if pointer.y!=king_in_check.y
          end
        end
      end
    end

    return false

  end

  private

  def populate_board!
    pieces.create(x: 'A', y: '1', type: 'Rook', color: 'white')
    pieces.create(x: 'B', y: '1', type: 'Knight', color: 'white')
    pieces.create(x: 'C', y: '1', type: 'Bishop', color: 'white')
    pieces.create(x: 'D', y: '1', type: 'Queen', color: 'white')
    pieces.create(x: 'E', y: '1', type: 'King', color: 'white')
    pieces.create(x: 'F', y: '1', type: 'Bishop', color: 'white')
    pieces.create(x: 'G', y: '1', type: 'Knight', color: 'white')
    pieces.create(x: 'H', y: '1', type: 'Rook', color: 'white')
    pieces.create(x: 'A', y: '2', type: 'Pawn', color: 'white')
    pieces.create(x: 'B', y: '2', type: 'Pawn', color: 'white')
    pieces.create(x: 'C', y: '2', type: 'Pawn', color: 'white')
    pieces.create(x: 'D', y: '2', type: 'Pawn', color: 'white')
    pieces.create(x: 'E', y: '2', type: 'Pawn', color: 'white')
    pieces.create(x: 'F', y: '2', type: 'Pawn', color: 'white')
    pieces.create(x: 'G', y: '2', type: 'Pawn', color: 'white')
    pieces.create(x: 'H', y: '2', type: 'Pawn', color: 'white')

    pieces.create(x: 'A', y: '8', type: 'Rook', color: 'black')
    pieces.create(x: 'B', y: '8', type: 'Knight', color: 'black')
    pieces.create(x: 'C', y: '8', type: 'Bishop', color: 'black')
    pieces.create(x: 'D', y: '8', type: 'Queen', color: 'black')
    pieces.create(x: 'E', y: '8', type: 'King', color: 'black')
    pieces.create(x: 'F', y: '8', type: 'Bishop', color: 'black')
    pieces.create(x: 'G', y: '8', type: 'Knight', color: 'black')
    pieces.create(x: 'H', y: '8', type: 'Rook', color: 'black')
    pieces.create(x: 'A', y: '7', type: 'Pawn', color: 'black')
    pieces.create(x: 'B', y: '7', type: 'Pawn', color: 'black')
    pieces.create(x: 'C', y: '7', type: 'Pawn', color: 'black')
    pieces.create(x: 'D', y: '7', type: 'Pawn', color: 'black')
    pieces.create(x: 'E', y: '7', type: 'Pawn', color: 'black')
    pieces.create(x: 'F', y: '7', type: 'Pawn', color: 'black')
    pieces.create(x: 'G', y: '7', type: 'Pawn', color: 'black')
    pieces.create(x: 'H', y: '7', type: 'Pawn', color: 'black')
  end

  


end
