class PiecesController < ApplicationController
  def update
    current_piece.update_attributes(piece_params)
    render :nothing => true, status => 200
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
