class King < Piece
  def can_castle?(rook)
    return false unless first_move?

    return false unless rook.first_move?

    return false if is_obstructed?(rook.x, rook.y)

    true
  end

  def castle!(rook)
    x_coords = current_to_destination_x_coordinates(rook.x)

    if x_coords.size == 3 || x_coords.size == 2
      update(x: x_coords[1])
      rook.update(x: x_coords[0])
      return [ type, rook.type,
              { king_x_coord: x_coords[1],
                rook_x_coord: x_coords[0]
              }
            ]
    end
  end

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
