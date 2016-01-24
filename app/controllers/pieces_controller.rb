class PiecesController < ApplicationController
  include GamesHelper
  before_action :require_authorized_for_updating_piece, :only => [:update]

  def show
    @piece = current_piece
    @game = @piece.game
    @pieces_hash = render_pieces(@game)
    @piece_pos_id = @piece.x + @piece.y.to_s
  end

  def update
    current_piece.update_attributes(piece_params)
    @game = current_piece.game
    redirect_to game_path(@game)
  end

  private

  helper_method :curent_piece

  def current_piece
    @current_piece ||= Piece.find(params[:id])
  end

  def piece_params
    params.require(:piece).permit(:x, :y)
  end

  def require_authorized_for_updating_piece

  end
end
