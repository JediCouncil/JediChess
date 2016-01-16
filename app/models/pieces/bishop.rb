class Bishop < Piece

  #find position, check for vertical/horizontal obstructions, move horizontally and check distance
  def valid_move ? (destination_x, destination_y)
    x_coord_distance = 0
    x_coord_indices = { 'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8 }
    x_coord_distance = (x_coord_indices[destination_x] - x_coord_indices[x]).abs

    y_coord_distance = (destination_y - y).abs

    if vertical_move ? (destination_x)
      !destination_piece.present ?
    elsif horizontal_move ? (destination_y)
      !destination_piece.present ?
      else
        x_coord_distance.abs <= 7 && y_coord_distance.abs <= 7
        return true
      end
  end

  #starting position
  def first_move?
    if black?
      y == 1 # starting at row 1
    else
      y == 8 # starting at row 8
    end
  end
end
