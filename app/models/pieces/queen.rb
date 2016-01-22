class Queen < Piece

	def valid_move?(destination_x, destination_y)
		x_coord_indices = { 'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8 }
		return false if is_obstructed?(destination_x, destination_y)
		return false if (x_coord_indices[destination_x] == x_coord_indices[x] && destination_y == y) #can't move to where it's at.
		return true if (x_coord_indices[destination_x] != x_coord_indices[x] && destination_y == y)#can move horizontally
		return true if (destination_y != y && x_coord_indices[destination_x] == x_coord_indices[x])#can move vertically
		return true if ((x_coord_indices[destination_x]-x_coord_indices[x]).abs == (destination_y-y).abs) #can move diagonally
		return false
	end

end
