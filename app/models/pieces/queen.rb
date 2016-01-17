class Queen < Piece
	def valid_move?(destination_x, destination_y)
		x_coord_indices = { 'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8 }

		if (x_coord_indices[destination_x] != x_coord_indices[x] && destination_y == y) || (destination_y != y && x_coord_indices[destination_x] == x_coord_indices[x]) || (x_coord_indices[destination_x]-x_coord_indices[x]).abs == (destination_y-y).abs && !is_obstructed?(destination_x, destination_y)
			true
		else
			false
		end
		# (destination_x != x && destination_y == y) || (destination_y != y && destination_x == x) || (destination_x-x).abs == (destination_y-y).abs && !is_obstructed?(destination_x, destination_y) ? true : false
	end

end
