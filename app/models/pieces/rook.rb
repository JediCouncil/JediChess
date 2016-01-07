class Rook < Piece
	def valid_move?(destination_x, destination_y)
		if x == destination_x || y == destination_y
			return true
		end
	end
end
