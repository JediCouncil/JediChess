class Bishop < Piece
  def valid_move?(destination_x, destination_y)
    return false if is_obstructed?(destination_x, destination_y) == true

    x_coord_indices = { 'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8 }
    x_coord_distance = (x_coord_indices[destination_x] - x_coord_indices[x]).abs
    y_coord_distance = (destination_y - y).abs

    # bishop moves are only valid when the x and y distances are equivalent
    # they are invalid otherwise
    if x_coord_distance == y_coord_distance
        return true
    else
        return false
  end
end
