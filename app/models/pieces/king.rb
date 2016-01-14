class King < Piece
  def valid_move?(destination_x, destination_y)
    x_coord_distance = 0
    x_coord_indices = { 'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8 }
    x_coord_distance += x_coord_indices[destination_x] - x_coord_indices[x]

    y_coord_distance = 0
    y_coord_distance += destination_y - y

    if x_coord_distance.abs <= 1 && y_coord_distance.abs <= 1
      return true
    else
      return false
    end
  end
end
