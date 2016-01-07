require 'rails_helper'

RSpec.describe PiecesController, type: :controller do
  let(:piece) { create(:piece, x: 'B', y: 2) }

  describe 'PUT #update' do
    it "updates piece's xy coordinates" do
      put :update, id: piece, piece: { x: 'D', y: 4 }
      piece.reload
      expect(piece.x).to eq('D')
      expect(piece.y).to eq(4)
    end
    it 'redirects to the game show page' do
      put :update, id: piece, piece: { x: 'B', y: 2 }
      expect(response).to redirect_to(game_path(piece.game))
    end
  end
end
