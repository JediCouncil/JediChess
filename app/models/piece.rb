class Piece < ActiveRecord::Base
  belongs_to :game

  enum color: [:black, :white]

  def self.types # find out if we absolutely need this!!!
    %w(Knight Bishop King Queen Rook Pawn)
  end

  def is_obstructed?(destination_x, destination_y) #return true if it's obstructed
    #define various ways an obstruction occurs: 
    #1). Check for obstrution for all pieces except for knight
    #2). Knight can't be obstructed
    x_coord_indices = { 'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8 }
    reverse_x_coord = { 1=> 'A', 2=>'B', 3=>'C', 4=>'D', 5=>'E', 6=>'F', 7=>'G', 8=>'H'}
    x_norm = x_coord_indices[x]

    destination_x_norm = x_coord_indices[destination_x]
    
    if type=="Knight"
      return false
    else
      # binding.pry
      destination_x_norm - x_norm >=0 ? direction_x = 1 : direction_x = -1
      destination_y - y >=0 ? direction_y = 1 : direction_y = -1
      turtle_x = x_norm
      turtle_y = y
      while turtle_x!=destination_x_norm || turtle_y!=destination_y
        # binding.pry
        #shorten the distance on both x, y by 1 unit
        if turtle_x !=destination_x_norm
          turtle_x += (direction_x*1)
        end 
        if turtle_y != destination_y
          turtle_y += (direction_y*1)
        end
        return true if Piece.find_by(x:reverse_x_coord[turtle_x], y:turtle_y, game_id: self.game_id)

      end
      return false
        
    end
  end

  def move_to!(destination_x, destination_y)
    destination_piece = Piece.find_by(x: destination_x, y: destination_y)

    if destination_piece.present?
      if destination_piece.color != color
        destination_piece.destroy
      else
        return
      end
    end
    update(x: destination_x, y: destination_y)
  end

  def move!(destination_x, destination_y)
    move_to!(destination_x, destination_y) if valid_move?(destination_x, destination_y)
  end
end
