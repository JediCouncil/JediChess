#error:
# {status: "error", errors: [{message: "Bad data."}]}

# #success:
# {status: "success", pieces_moved: [
#   {type: "Rook", position: {x: 'A', y: 1}}
# ], pieces_destroyed: []}

class PiecesController < ApplicationController
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
    @result = current_piece.move_to!(params[:piece][:x], params[:piece][:y])
    # binding.pry
    return render json: @result
    # can it move?
    # when moving is anyting destroyed?
    # render the move and destoryed attributes
    # otherwise its an error, or invalid move

    # render nothing: true
    # render :text => "successful"
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
