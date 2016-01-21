class PiecesController < ApplicationController
  def update
    current_game = current_piece.game
    destination_piece = current_game.pieces.find_by(piece_params)

    unless destination_piece.nil?
      if current_piece.type == "King" && destination_piece.type == "Rook"
        if current_piece.can_castle?(destination_piece)
          @result_array = current_piece.move_to!(params[:piece][:x], params[:piece][:y])
        end
        return render json: @result_array
      end
    end

    current_piece.update_attributes(piece_params)
    render :text => "successful"
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
