class Queen < Piece
	def valid_move?(destination_x, destination_y)
		x_coord_indices = { 'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8 }

		return false if is_obstructed?(destination_x, destination_y)
		

		return true if (x_coord_indices[destination_x] != x_coord_indices[x] && destination_y == y)
		return true if (destination_y != y && x_coord_indices[destination_x] == x_coord_indices[x])
		return true if (x_coord_indices[destination_x]-x_coord_indices[x]).abs == (destination_y-y).abs)
		return false

	end

end
