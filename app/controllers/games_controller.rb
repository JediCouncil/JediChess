class GamesController < ApplicationController
  def new
    @game = Game.new
  end

	def create
		@game = Game.new(game_params)
	end

	def show
		@game ||= Game.where(id: params[:id]).last
		@pieces = @game.pieces
	end

	private

	def game_params
		params.require(:game).permit(
			:white_player_id, 
			:black_player_id,
			:score, 
			:result)
	end
end
