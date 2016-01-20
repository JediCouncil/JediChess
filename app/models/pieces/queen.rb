class Queen < Piece
	def valid_move?(destination_x, destination_y)
		x_coord_indices = { 'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6, 'g' => 7, 'h' => 8 }
		
		return false if is_obstructed?(destination_x, destination_y)
		return true if (x_coord_indices[destination_x] != x_coord_indices[x] && destination_y == y)#can move horizontally
		return true if (destination_y != y && x_coord_indices[destination_x] == x_coord_indices[x])#can move vertically
		return true if ((x_coord_indices[destination_x]-x_coord_indices[x]).abs == (destination_y-y).abs) #can move diagonally
		return false if (x_coord_indices[destination_x] == x_coord_indices[x] && destination_y == y) #can't move to where it's at.
		return false
	end

end
