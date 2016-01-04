class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
  end

  def show
    @game = Game.find(params[:id])
  end

  def index
    @games = Game.available
  end
end
