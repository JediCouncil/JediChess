class Piece < ActiveRecord::Base
	belongs_to :player
	belongs_to :game

	enum status: [:black, :white]

  def is_obstructed(destination_x, destination_y)

  end

end
