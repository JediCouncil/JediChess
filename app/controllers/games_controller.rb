class GamesController < ApplicationController

  def index
    @games = Game.available
  end

  def new
    @game = Game.new
  end

	def create
		@game = Game.create()
    redirect_to game_path(@game)
	end

	def show
		@game = Game.find(params[:id])
	end

end
