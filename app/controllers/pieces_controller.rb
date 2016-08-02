class PiecesController < ApplicationController
  def update
    current_game = current_piece.game
    destination_piece = current_game.pieces.find_by(piece_params)

    if destination_piece.present? && current_piece.can_castle?(destination_piece)
      @result = current_piece.move_to!(params[:piece][:x], params[:piece][:y])
      return render json: @result
    end

    @result = current_piece.move!(params[:piece][:x], params[:piece][:y].to_i)

    # No need to send @result data because changes in db already reflected
    # by user that moved chess piece

    #We could just send the data as a response to the other user's ajax request

    # Pusher.trigger("game-#{current_game.id}", 'refresh_page', {:message => "Your Move!"})

    render json: @result
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
