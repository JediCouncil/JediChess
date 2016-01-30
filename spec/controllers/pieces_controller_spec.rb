require 'rails_helper'

RSpec.describe PiecesController, type: :controller do
  describe 'PUT #update' do
    let(:game) { create(:game) }
    let(:piece) { game.pieces.find_by(x: 'A', y: 1, type: 'Rook', color: 'black') }

    context 'not obstructed' do
      it "updates piece's xy coordinates" do
        obstructed_piece = game.pieces.find_by(x: 'A', y: 2)
        obstructed_piece.destroy
        put :update, id: piece, piece: { x: 'A', y: 4 }
        piece.reload
        expect(piece.x).to eq('A')
        expect(piece.y).to eq(4)
      end
    end

    context 'obstructed' do
      it "updates piece's xy coordinates" do
        put :update, id: piece, piece: { x: 'A', y: 4 }
        piece.reload
        expect(piece.x).to eq('A')
        expect(piece.y).to eq(1)
      end
    end

    context 'it is not the white_player\'s turn' do
      it 'will not let them move pieces' do
        put :update
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
