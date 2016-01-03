class Pawn < Piece

  def valid_move?(destination_x, destination_y)
    #invalid move error raises if moving to same current
    #xy coordinates

    #check if path is obstructed
    obstructed = is_obstructed?(destination_x, destination_y)
    return false if obstructed

    #check if it's backward move
    backwards = backward_move?(destination_y)
    return false if backwards

    #find distance
    y_coords = current_to_destination_y_coordinates(destination_y)
    y_distance = y_coords.length

    if first_move?
      y_distance <= 1 ? true : false
    else
      #move only 1 space
      if y_distance < 1
        true
      else
        false
      end
    end
  end

  def first_move?
    if black?
      y == 2 ? true : false#starting y-cord is 2
    else
      y == 7 ? true : false#starting y-cord is 7
    end
  end

  def backward_move?(destination_y)
    if black?
      destination_y < y ? true : false
    else
      destination_y > y ? true : false
    end
  end
end

