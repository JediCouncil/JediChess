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

  def diagonal_obstruction?(destination_x, destination_y)

  end

  def vertical_obstruction?(destination_x, destination_y)
  end

  def horizontal_obstruction?(destination_x, destination_y)
  end


end
