class King < Piece
  def can_castle?(rook)
    return false unless first_move == 'true'

    return false unless rook.first_move == 'true'

    return false if is_obstructed?(rook.x, rook.y)

    true
  end

  def castle!(rook)
    x_coords = current_to_destination_x_coordinates(rook.x)

    if x_coords.size == 3 || x_coords.size == 2
      update(x: x_coords[1])
      rook.update(x: x_coords[0])
    end
  end
end
