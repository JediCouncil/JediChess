require 'rails_helper'

RSpec.describe Pawn, type: :model do
  describe '#valid_move?' do
    context 'first move' do
      let(:black_pawn) { build(:pawn, color: 'black', x: 'B', y: 7) }
      let(:white_pawn) { build(:pawn, color: 'white', x: 'C', y: 2) }

      it 'black pawn can move 2 spaces' do
        result = black_pawn.valid_move?('B', 5)
        expect(result).to be true
      end

      it 'black pawn can move 1 space' do
        result = black_pawn.valid_move?('B', 6)
        expect(result).to be true
      end

      it "black pawn can't move 3 spaces" do
        result = black_pawn.valid_move?('B', 4)
        expect(result).to be false
      end

      it "black pawn can't move backwards" do
        result = black_pawn.valid_move?('B', 8)
        expect(result).to be false
      end

      it "black pawn can't move diagonal if piece not present" do
        result = black_pawn.valid_move?('A', 6)
        expect(result).to be false
      end

      it 'white pawn can move 2 spaces' do
        result = white_pawn.valid_move?('C', 4)
        expect(result).to be true
      end

      it 'white pawn can move 1 space' do
        result = white_pawn.valid_move?('C', 3)
        expect(result).to be true
      end

      it "white pawn can't move 3 spaces" do
        result = white_pawn.valid_move?('C', 5)
        expect(result).to be false
      end

      it "white pawn can't move backwards" do
        result = white_pawn.valid_move?('C', 1)
        expect(result).to be false
      end

      it "white pawn can't move horizontal" do
        result = white_pawn.valid_move?('D', 2)
        expect(result).to be false
      end

      it "white pawn can't move diagonal if piece not present" do
        result = white_pawn.valid_move?('D', 3)
        expect(result).to be false
      end
    end

    context 'not first move' do
      let(:black_pawn) { build(:pawn, color: 'black', x: 'C', y: 4, first_move: false) }
      let(:white_pawn) { build(:pawn, color: 'white', x: 'B', y: 6, first_move: false) }

      it 'black pawn can move 1 space' do
        result = black_pawn.valid_move?('C', 3)
        expect(result).to be true
      end

      it "black pawn can't move 2 spaces" do
        result = black_pawn.valid_move?('C', 2)
        expect(result).to be false
      end

      it "black pawn can't move backwards" do
        result = black_pawn.valid_move?('C', 5)
        expect(result).to be false
      end

      it "black pawn can't move horizontal" do
        result = black_pawn.valid_move?('B', 4)
        expect(result).to be false
      end

      it "black pawn can't move diagonal if piece not present" do
        result = black_pawn.valid_move?('D', 5)
        expect(result).to be false
      end

      it 'white pawn can move 1 space' do
        result = white_pawn.valid_move?('B', 7)
        expect(result).to be true
      end

      it "white pawn can't move 2 spaces" do
        result = white_pawn.valid_move?('B', 8)
        expect(result).to be false
      end

      it "white pawn can't move backwards" do
        result = white_pawn.valid_move?('B', 5)
        expect(result).to be false
      end

      it "white pawn can't move horizontal" do
        result = white_pawn.valid_move?('C', 6)
        expect(result).to be false
      end

      it "white pawn can't move diagonal if piece not present" do
        result = white_pawn.valid_move?('C', 7)
        expect(result).to be false
      end
    end

    context 'capture' do
      let(:game) { create(:game) }
      let(:black_pawn) { game.pieces.find_by(color: 0, x: 'B', y: 7) }
      let(:white_pawn) { game.pieces.find_by(color: 1, x: 'C', y: 2) }

      it 'can capture one square diagonally', focus: true do
        white_pawn.update(x: 'C', y: 6)

        result = black_pawn.valid_move?('C', 6)
        expect(result).to be true
      end

      it "can't capture vertically" do
        white_pawn.update(x: 'B', y: 6)

        result = black_pawn.valid_move?('B', 6)
        expect(result).to be false
      end

      it "can't capture horizontally" do
        black_pawn.update(x: 'E', y: 4)
        white_pawn.update(x: 'E', y: 3)

        result = black_pawn.valid_move?('E', 3)
        expect(result).to be false
      end
    end
  end
end
