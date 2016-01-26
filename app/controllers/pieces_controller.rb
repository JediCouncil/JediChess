class PiecesController < ApplicationController
  include PiecesHelper

  def update
    current_game = current_piece.game
    destination_piece = current_game.pieces.find_by(piece_params)

    unless destination_piece.nil?
      if current_piece.type == "King" && destination_piece.type == "Rook"
        if current_piece.can_castle?(destination_piece)
          @result = current_piece.move_to!(params[:piece][:x], params[:piece][:y])
        end
        return render json: @result
      end
    end
    @result = current_piece.move!(params[:piece][:x], params[:piece][:y].to_i)
    return render json: @result
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
