class King < Piece
	def valid_move?(destination_x, destination_y)
		# not a valid move if obstructed
		return false if is_obstructed?(destination_x, destination_y)

		# get x_coord_distance
		x_coord_distance = 0
		x_coord_indices = { 'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8 }
		x_coord_distance += x_coord_indices[destination_x] - x_coord_indices[x]
	
		# get y_coord_distance
		y_coord_distance = 0
		y_coord_distance += destination_y - y
		
		if x_coord_distance <= 1 && y_coord_distance <= 1
			# valid move
			return true
		else
			# this is for if the king moves 
			# more than 1 step; will not be valid move
			return false
		end
	end
end