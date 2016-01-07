class Rook < Piece
	def valid_move?(destination_x, destination_y)
		return true if x == destination_x || y == destination_y
	end
end
