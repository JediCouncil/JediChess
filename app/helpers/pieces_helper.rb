module PiecesHelper
  def castling(destination_piece)
    unless destination_piece.nil?
      if current_piece.type == 'King' && destination_piece.type == 'Rook'
        if current_piece.can_castle?(destination_piece)
          result = current_piece.move_to!(params[:piece][:x], params[:piece][:y])
        else
          return false
        end
        return result
      end
   end
  end
end
