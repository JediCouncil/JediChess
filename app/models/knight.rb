class Knight < Piece
	def valid_move?(destination_x, destination_y)
		return false unless horizontal_first_steps?
		return false unless vertical_first_steps?
		
		# find distance between starting and ending coordinates:
	  y_coords = current_to_destination_y_coordinates(destination_y)
	  y_coords_distance = y_coords.length

	  x_coords = current_to_destination_x_coordinates(destination_x)
	  x_coords_distance = x_coords.length
	end

	# The knight can move either 2 vertically(y-axis) then 1 horizontally,
  # OR 2 horizontally(x-axis) then 1 vertically in either direction.
  # No other moves are valid.

	def horizontal_first_steps?
		x_distance == 2 && y_distance == 1
	end

	def vertical_first_steps?
		y_distance == 2 && x_distance == 1
	end
end