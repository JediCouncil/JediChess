class Queen < Piece
	def valid_move?(destination_x, destination_y)
		x_array = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
		x_array.map!.with_index{|x,i| i+1 } 
		if (destination_x != x && destination_y == y) || (destination_y != y && destination_x == x) || (destination_x-x).abs == (destination_y-y).abs && !is_obstructed?(destination_x, destination_y)
			true
		else
			false
		end
		# (destination_x != x && destination_y == y) || (destination_y != y && destination_x == x) || (destination_x-x).abs == (destination_y-y).abs && !is_obstructed?(destination_x, destination_y) ? true : false
	end

end
