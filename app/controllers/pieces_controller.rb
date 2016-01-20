class PiecesController < ApplicationController
  def update
    current_game = current_piece.game
    destination_piece = current_game.pieces.find_by(piece_params)

    unless destination_piece.nil?
      if current_piece.type == "King" && destination_piece.type == "Rook"
        if current_piece.can_castle?(destination_piece)
          # binding.pry
          current_piece.move_to!(params[:piece][:x], params[:piece][:y])
        end
        render :text => "attempting to castle"
      end
    end
    # current piece is a king
    # destination_coordinates is of a rook
    # call the can_castle method

    current_piece.update_attributes(piece_params)
    # render :nothing => true, status => 200
    render :text => "hello ajax"
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
