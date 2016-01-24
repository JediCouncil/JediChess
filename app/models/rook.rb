class Rook < Piece
  def valid_move?(destination_x, destination_y)
    return false if is_obstructed?(destination_x, destination_y) == true
    return false if (destination_x != x) && (destination_y != y)
    return true if x == destination_x || y == destination_y
  end
end
