class Pawn < Piece

  def valid_move?(destination_x, destination_y)
    #invalid move error raises if moving to same current
    #xy coordinates

    #check if it's backward/horizontal move
    invalid_move = invalid_move?(destination_y)
    return false if invalid_move

    #find distance
    y_coords = current_to_destination_y_coordinates(destination_y)
    y_distance = y_coords.length

    #check if pawn can move correct # of spaces
    if first_move?
      #check if path is obstructed
      obstructed = is_obstructed?(destination_x, destination_y)
      return false if obstructed
      valid_spaces = (y_distance <= 1 ? true : false)
    else
      #move only 1 space
      valid_spaces = (y_distance < 1 ? true : false)
    end

    #now we know that we can move correct # of spaces
    #check if piece is present on destination
    destination_piece = Piece.find_by(x: destination_x, y: destination_y)


    #check if its a vertical or diagonal move
    if valid_spaces
      if vertical_move?(destination_x)
        destination_piece.present? ? false : true
      else
        #diagonal
      end
    else
      #not valid spaces
      return false
    end

  end

  def invalid_move?(destination_y)
    #horizontal move
    return true if y == destination_y
    #backwards move
    if black?
      destination_y < y ? true : false
    else
      destination_y > y ? true : false
    end
  end

  def first_move?
    if black?
      y == 2 ? true : false#starting y-cord is 2
    else
      y == 7 ? true : false#starting y-cord is 7
    end
  end

  def vertical_move?(destination_x)
    destination_x == x ? true : false
  end

end

