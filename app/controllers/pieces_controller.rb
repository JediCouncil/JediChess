class PiecesController < ApplicationController

  def show
    @piece = current_piece
    @piece_pos_id = @piece.x + @piece.y.to_s
    respond_to do |format|
      format.js
    end
  end

  def update
    current_piece.update_attributes(piece_params)
  end

  private

  helper_method :curent_piece

  def current_piece
    @current_piece ||= Piece.find(params[:id])
  end

  def piece_params
    params.require(:piece).permit(:x, :y)
  end
end
