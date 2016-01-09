class King < Piece
  def can_castle?(rook)
    return false unless first_move == "true"

    return false unless rook.first_move == "true"

    return false if is_obstructed?(rook.x, rook.y)

    return true
  end
end
