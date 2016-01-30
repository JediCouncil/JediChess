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

  def show
    @game = Game.find(params[:id])
    gon.pieces_hash = render_pieces(@game) # call the helper function and get the hash. will be passed onto the view
    Pusher.trigger("game-#{game.id}", 'refresh_page', {:message => "Your Move!"})
  end
end
