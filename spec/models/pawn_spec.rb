require 'rails_helper'

RSpec.describe Pawn, type: :model do
  describe '#valid_move?' do
    context 'first move' do
      let(:black_pawn) { build(:pawn, color: 'black', x: 'B', y: 2) }
      let(:white_pawn) { build(:pawn, color: 'white', x: 'C', y: 7) }

      it 'black pawn can move 2 spaces' do
        result = black_pawn.valid_move?('B', 4)
        expect(result).to be true
      end

      it 'black pawn can move 1 space' do
        result = black_pawn.valid_move?('B', 3)
        expect(result).to be true
      end

      it "black pawn can't move 3 spaces" do
        result = black_pawn.valid_move?('B', 5)
        expect(result).to be false
      end

      it "black pawn can't move backwards" do
        result = black_pawn.valid_move?('B', 1)
        expect(result).to be false
      end

      it "black pawn can't move diagonal if piece not present" do
        result = black_pawn.valid_move?('A', 3)
        expect(result).to be false
      end


      it 'white pawn can move 2 spaces' do
        result = white_pawn.valid_move?('C', 5)
        expect(result).to be true
      end

      it 'white pawn can move 1 space' do
        result = white_pawn.valid_move?('C', 6)
        expect(result).to be true
      end

      it "white pawn can't move 3 spaces" do
        result = white_pawn.valid_move?('C', 4)
        expect(result).to be false
      end

      it "white pawn can't move backwards" do
        result = white_pawn.valid_move?('C', 8)
        expect(result).to be false
      end

      it "white pawn can't move horizontal" do
        result = white_pawn.valid_move?('B', 7)
        expect(result).to be false
      end

      it "white pawn can't move diagonal if piece not present" do
        result = white_pawn.valid_move?('D', 6)
        expect(result).to be false
      end
    end

    context 'not first move' do
      let(:black_pawn) { build(:pawn, color: 'black', x: 'C', y: 4) }
      let(:white_pawn) { build(:pawn, color: 'white', x: 'B', y: 6) }

      it 'black pawn can move 1 space' do
        result = black_pawn.valid_move?('C', 5)
        expect(result).to be true
      end

      it "black pawn can't move 2 spaces" do
        result = black_pawn.valid_move?('C', 6)
        expect(result).to be false
      end

      it "black pawn can't move backwards" do
        result = black_pawn.valid_move?('C', 2)
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
        result = white_pawn.valid_move?('B', 5)
        expect(result).to be true
      end

      it "white pawn can't move 2 spaces" do
        result = white_pawn.valid_move?('B', 4)
        expect(result).to be false
      end

      it "white pawn can't move backwards" do
        result = white_pawn.valid_move?('B', 7)
        expect(result).to be false
      end

      it "white pawn can't move horizontal" do
        result = white_pawn.valid_move?('C', 7)
        expect(result).to be false
      end

      it "white pawn can't move diagonal if piece not present" do
        result = white_pawn.valid_move?('A', 5)
        expect(result).to be false
      end
    end

    context 'capture' do
      let(:black_pawn) { build(:pawn, color: 'black', x: 'F', y: 3) }
      let(:white_pawn) { build(:pawn, color: 'white') }

      it 'can capture one square diagonally' do
        white_pawn.update(x: 'G', y: 4)

        result = black_pawn.valid_move?('G', 4)
        expect(result).to be true
      end

      it "can't capture vertically" do
        white_pawn.update(x: 'F', y: 4)

        result = black_pawn.valid_move?('F', 4)
        expect(result).to be false
      end

      it "can't capture horizontally" do
        white_pawn.update(x: 'E', y: 3)

        result = black_pawn.valid_move?('E', 3)
        expect(result).to be false
      end
    end
  end
end
