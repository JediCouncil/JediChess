class King < Piece
	def valid_move?
		# Find king's current position on board.
		king = King.find_by(x, y)
		# Check if valid move, or if obstructed.
		if king.is_obstructed?
			invalid_move = 'King is obstructed -- try again!'
      		fail invalid_move
		else king != is_obstructed?
			move_king
		end
	end

	def move_king(destination_x, destination_y)
		if destination_x == 1 || destination_y == 1
			update(x: destination_x, y: destination_y)
		else
			return false
		end
	end
end