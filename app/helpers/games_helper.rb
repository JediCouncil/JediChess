module GamesHelper
	def piece_image(game, player, piece_type)
		color = game.white_player_id == user.id ? 'white' : 'black'
		image_tag "#{color}#{piece_type.downcase}.svg"
	end

	def row_range
		current_user.id == game.white_player_id ? 7.downto(0).to_a : (0..7).to_a
	end
end
