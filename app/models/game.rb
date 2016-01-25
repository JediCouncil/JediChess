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

  def checkmate?
    #Use check? method
    #if a game is in check?(), iterate through every possible move King could make and determine if the game is still in check, return false if at least one move still return true on game.check?(). 
    x_coord_indices = { 'A' => 1, 'B' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6, 'g' => 7, 'h' => 8 }

    if check?
      #retrieve the king color that's in check
      king_is_in_check?('black') ? color == 'black': color == 'white'

      #retrieve king's position
      king = pieces.find_by(type: "King", color: color)
      x = king.x
      y = king.y
     
    end 
    false #if the game is not in check, there is no checkmate
  end

end
