class Piece < ActiveRecord::Base
  belongs_to :game

  enum color: [:black, :white]

  def self.types # find out if we absolutely need this!!!
    %w(Knight Bishop King Queen Rook Pawn)
  end

  def is_obstructed?(destination_x, destination_y)
    if destination_x == x # vertical line
      x_distance = 0
    else # diagonal/horizontal line
      if x > destination_x
        x_distance = -((destination_x..x).to_a.length - 1)
      else
        x_distance = ((x..destination_x).to_a.length) - 1
      end
    end

    slope = (destination_y - y).to_f / (x_distance).to_f

    if slope == 1 || slope == -1
      diagonal_obstruction?(destination_x, destination_y)
    elsif slope == 0
      horizontal_obstruction?(destination_x, destination_y)
    elsif slope == -Float::INFINITY || slope == Float::INFINITY
      vertical_obstruction?(destination_x, destination_y)
    else
      invalid_move = 'Invalid input. Not diagonal, horizontal, or vertical'
      fail invalid_move
    end
  end

  def current_to_destination_x_coordinates(destination_x)
    if destination_x > x
      x_coordinates = (x...destination_x).to_a[1..-1]
    else
      x_coordinates = (destination_x...x).to_a.reverse[0..-2]
    end
  end

  def current_to_destination_y_coordinates(destination_y)
    if destination_y > y
      y_coordinates = (y...destination_y).to_a[1..-1]
    else
      y_coordinates = (destination_y...y).to_a.reverse[0..-2]
    end
  end

  def check_coordinates(x_coordinates, y_coordinates)
    xy_coords = x_coordinates.zip(y_coordinates)

    xy_coords.each do |xy_coord|
      x = xy_coord[0]
      y = xy_coord[1]
      obstruent_piece = Piece.find_by(x: x, y: y)
      return true if obstruent_piece.present?
    end
    false
  end

  def diagonal_obstruction?(destination_x, destination_y)
    x_coordinates = current_to_destination_x_coordinates(destination_x)
    y_coordinates = current_to_destination_y_coordinates(destination_y)

    check_coordinates(x_coordinates, y_coordinates)
  end

  def vertical_obstruction?(_destination_x, destination_y)
    y_coordinates = current_to_destination_y_coordinates(destination_y)
    x_coordinates = [x] * y_coordinates.count

    check_coordinates(x_coordinates, y_coordinates)
  end

  def horizontal_obstruction?(destination_x, _destination_y)
    x_coordinates = current_to_destination_x_coordinates(destination_x)
    y_coordinates = [y] * x_coordinates.count

    check_coordinates(x_coordinates, y_coordinates)
  end

  def move_to!(piece_id, destination_x, destination_y)
    current_piece = Piece.find_by(id: piece_id)
    current_game = current_piece.game.id
    destination_piece = Piece.find_by(game_id: current_game, x: destination_x, y: destination_y)

    if destination_piece.present?
      if destination_piece.color != color
        destination_piece.destroy
      else
        return false # function return false if no move is made
      end
    end

    update_attributes(x: destination_x, y: destination_y)
    true # return true if a move has been made (a. dest_cell piece killed; b. no piece present in dest_cell)
  end
end
