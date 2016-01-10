class Knight < Piece
  def valid_move?(destination_x, destination_y)
    x_coord_indices = { 'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8 }

    x_coord_distance = (x_coord_indices[destination_x] - x_coord_indices[x]).abs
    y_coord_distance = (destination_y - y).abs

    return true if (x_coord_distance == 2 && y_coord_distance == 1) || (y_coord_distance == 2 && x_coord_distance == 1)
    false
  end
end
