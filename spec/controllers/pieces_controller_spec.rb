require 'rails_helper'

RSpec.describe PiecesController, type: :controller do
  describe 'PUT #update' do
    let(:game) { create(:game) }
    let(:piece) { game.pieces.first }

    it "updates piece's xy coordinates" do
      put :update, id: piece, piece: { x: 'B', y: 1 }
      piece.reload
      expect(piece.x).to eq('B')
      expect(piece.y).to eq(1)
    end
    it 'redirects to the game show page' do
      put :update, id: piece, piece: { x: 'B', y: 1 }
      expect(response).to redirect_to(game_path(game))
    end
  end
end
