class GamesController < ApplicationController
  helper GamesHelper

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
 
    @pos_id_array = []
    @piece_class_array = [] #will be accessed by the template

    @game.pieces.each do |piece|
      pos_id = piece.x + piece.y.to_s #gon.pos_id = a8
      piece_class = piece.color + '_' + piece.type.downcase # gon.piece_class = white_knight
      @pos_id_array << pos_id
      @piece_class_array << piece_class
    end

	end

end
