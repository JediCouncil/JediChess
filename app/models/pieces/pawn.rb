class Pawn < Piece
  def valid_move?(destination_x, destination_y)
    return false if backward_or_horizontal_move?(destination_y)

    # find distance
    y_coords = current_to_destination_y_coordinates(destination_y)
    y_distance = y_coords.length

    # check if pawn can move correct # of spaces
    if first_move?
      return false if is_obstructed?(destination_x, destination_y)
      valid_spaces = (y_distance <= 1)
    else
      # move only 1 space
      valid_spaces = (y_distance < 1)
    end

    return false unless valid_spaces

    # check if piece is present on destination
    destination_piece = Piece.find_by(x: destination_x, y: destination_y)

    # check if move is vertical/diagonal
    if vertical_move?(destination_x)
      !destination_piece.present?
    else # diagonal move
      destination_piece.present?
    end
  end

  private

  def backward_or_horizontal_move?(destination_y)
    # horizontal move
    return true if y == destination_y
    # backwards move
    if black?
      destination_y < y
    else
      destination_y > y
    end
  end

  def vertical_move?(destination_x)
    destination_x == x
  end
end
