class Piece < ActiveRecord::Base
	belongs_to :player
	belongs_to :game

	enum status: [:black, :white]

  def is_obstructed?(destination_x, destination_y)
    x1, y1 = self.x, self.y
    x2, y2 = destination_x, destination_y

    if x2 == x1 #vertical line
      x_distance = 0
    else        #diagonal/horizontal line
      if x1 > x2
        x_distance = -((x2..x1).to_a.length - 1)
      else
        x_distance = ((x1..x2).to_a.length) - 1
      end
    end

    slope = (y2 - y1).to_f / (x_distance).to_f

    if slope == 1 || slope == -1
      diagonal_obstruction?(x2, y2)
    elsif slope == 0
      horizontal_obstruction?(x2, y2)
    elsif slope == -Float::INFINITY||
          slope == Float::INFINITY
      vertical_obstruction?(x2, y2)
    else
      raise "Invalid input. Not diagonal, horizontal, or vertical"
    end
  end

  def set_x_coordinates(starting_x, destination_x)
    if destination_x > x
      x_coordinates = (x...destination_x).to_a[1..-1]
    else
      x_coordinates = (destination_x...x).to_a.reverse[0..-2]
    end
  end

  def set_y_coordinates(starting_y, destination_y)
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
    return false
  end

  def diagonal_obstruction?(destination_x, destination_y)
    x_coordinates = set_x_coordinates(x, destination_x)
    y_coordinates = set_y_coordinates(y, destination_y)

    check_coordinates(x_coordinates, y_coordinates)
  end

  def vertical_obstruction?(destination_x, destination_y)
    y_coordinates = set_y_coordinates(y, destination_y)
    x_coordinates = [self.x] * y_coordinates.count

    check_coordinates(x_coordinates, y_coordinates)
  end

  def horizontal_obstruction?(destination_x, destination_y)
    x_coordinates = set_x_coordinates(x, destination_x)
    y_coordinates = [self.y] * x_coordinates.count

    check_coordinates(x_coordinates, y_coordinates)
  end

end
