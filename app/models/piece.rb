class Piece < ActiveRecord::Base
  belongs_to :game

  enum color: [:black, :white]

  def self.types # find out if we absolutely need this!!!
    %w(Knight Bishop King Queen Rook Pawn)
  end

  def is_obstructed?(destination_x, destination_y) # return true if it's obstructed
    # define various ways an obstruction occurs:
    # 1). Check for obstrution for all pieces except for knight
    # 2). Knight can't be obstructed
    x_coord_indices = { 'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8 }
    reverse_x_coord = { 1 => 'A', 2 => 'B', 3 => 'C', 4 => 'D', 5 => 'E', 6 => 'F', 7 => 'G', 8 => 'H' }
    x_norm = x_coord_indices[x]

    destination_x_norm = x_coord_indices[destination_x]

    if type == 'Knight'
      return false
    else
      destination_x_norm - x_norm >= 0 ? direction_x = 1 : direction_x = -1
      destination_y - y >= 0 ? direction_y = 1 : direction_y = -1
      turtle_x = x_norm
      turtle_y = y
      while turtle_x != destination_x_norm || turtle_y != destination_y
        # shorten the distance on both x, y by 1 unit
        turtle_x += (direction_x * 1) if turtle_x != destination_x_norm
        turtle_y += (direction_y * 1) if turtle_y != destination_y
        return false if turtle_x == destination_x_norm && turtle_y == destination_y
        return true if Piece.find_by(x: reverse_x_coord[turtle_x], y: turtle_y, game_id: game_id)

      end
      return false

    end
  end

  def current_to_destination_x_coordinates(destination_x)
    if destination_x > x
      x_coordinates = (x...destination_x).to_a[1..-1]
    else
      x_coordinates = (destination_x...x).to_a.reverse[0..-2]
    end
  end

  def current_to_destination_y_coordinates(destination_y)
    if destination_y > y
      y_coordinates = (y...destination_y).to_a[1..-1]
    else
      y_coordinates = (destination_y...y).to_a.reverse[0..-2]
    end
  end

  def check_coordinates(x_coordinates, y_coordinates)
    xy_coords = x_coordinates.zip(y_coordinates)

    xy_coords.each do |xy_coord|
      x = xy_coord[0]
      y = xy_coord[1]
      obstruent_piece = Piece.find_by(x: x, y: y, game_id: game_id)
      return true if obstruent_piece.present?
    end
    false
  end

  def can_castle?(piece)
    false
  end

  def move_to!(destination_x, destination_y)
    destination_piece = Piece.find_by(x: destination_x, y: destination_y, game_id: game_id)
    results = { status: 'success', pieces_moved: [], pieces_destroyed: [] }

    if destination_piece.present?
      if destination_piece.color != color
        piece_destroyed_hsh = { type: destination_piece.type, position: { x: destination_x, y: destination_y } }
        results[:pieces_destroyed] << piece_destroyed_hsh
        destination_piece.destroy
      else
        if type == 'King' && destination_piece.type == 'Rook'
          return castle!(destination_piece)
        end
        return false
      end
    end

    piece_moved_hsh = { type: type, original_position: { x: x, y: y }, new_position: { x: destination_x, y: destination_y } }
    results[:pieces_moved] << piece_moved_hsh
    update(x: destination_x, y: destination_y, first_move: false)
    results
  end

  def move!(destination_x, destination_y)
    move_to!(destination_x, destination_y) if valid_move?(destination_x, destination_y)
  end
end
