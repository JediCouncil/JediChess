class GamesController < ApplicationController
  include GamesHelper

  def index
    @games = Game.available
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create
    redirect_to game_path(@game)
  end

  # def update
  #   current_game.update_attributes(game_params)
  # end

  def show
    @game = Game.find(params[:id])
    gon.pieces_hash = render_pieces(@game) # call the helper function and get the hash. will be passed onto the view
  end

  private

  def current_game
    @current_game ||= Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:score, :result, :white_player_id, :black_player_id, :turn)
  end
end
