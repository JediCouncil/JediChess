class Bishop < Piece

  #find position, check for vertical/horizontal obstructions, move horizontally and check distance
  def valid_move?(destination_x, destination_y)
    return false if is_obstructed?(destination_x, destination_y) == true

    # Return false if it is obstructed. - DONE
    #
    # Return true if a diagonal move
    #  otherwise we return false
    #
    #
    # How do we know if something is a diagonal move?
    #  - Up 1 & Right 1 = true
    #  - Up 2 & Right 2 = true
    #  - Up 1 & Right 0 = false
    #
    #  1. How do we get the distance of the movement?

    x_coord_indices = { 'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8 }

    x_coord_distance = (x_coord_indices[destination_x] - x_coord_indices[x]).abs
    y_coord_distance = (destination_y - y).abs

    #  2. Are the distances the same?

  end
end
