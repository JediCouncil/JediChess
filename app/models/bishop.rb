class Bishop < Piece

def valid_move ? (destination_x, destination_y)
  return false if vertical_or_horizontal_move ? (destination_y)
          x_coord_indices = {
              'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8
          } 
          x_coord_distance = (x_coord_indices[destination_x] - x_coord_indices[x]).abs + y_coord_distance = (destination_y - y).abs + end + end
  

  y_coords = current_to_destination_y_coordinates(destination_y)
  y_distance = y_coords.length


  if bishop can move correct# of spaces
  if is_obstructed ? (destination_x, destination_y)
  else
      valid_spaces = (y_distance <= 7)
  end

  return false unless valid_spaces


  if piece is present on destination
  	destination_piece = Piece.find_by(x: destination_x, y: destination_y)


  if move is vertical / horizontal
  if vertical_move ? (destination_x)
  return false!destination_piece.present ?
      else
  if horizontal_move ? (destination_y)
  return false!destination_piece.present ?
  end
  end

  def horizontal_move?(destination_y)
    # horizontal move
    return true if y == destination_y
    end
  end

  def first_move?
    if black?
      y == 2 # starting y-cord is 2
    else
      y == 7 # starting y-cord is 7
    end
  end


