require 'rails_helper'

RSpec.describe King, type: :model do
  describe '#can_castle' do
    let(:black_king) { build(:king, x: 'E', y: 8, color: 'black') }
    let(:black_rook) { build(:rook, x: 'A', y: 8, color: 'black') }
    let(:white_king) { build(:king, x: 'E', y: 1, color: 'white') }
    let(:white_rook) { build(:rook, x: 'A', y: 1, color: 'white') }

    context 'king and rook unmoved and no obstructions' do 
      it 'returns true' do
        result = black_king.can_castle?(black_rook)
        expect(result).to be true
      end
      it 'returns true' do
        result = white_king.can_castle?(white_rook)
        expect(result).to be true
      end
    end
    context 'king moved, and no obstructions' do
      it 'returns false' do
        black_king.first_move = 'false'
        result = black_king.can_castle?(black_rook)
        expect(result).to be false
      end
      it 'returns false' do
        white_king.first_move = 'false'
        result = white_king.can_castle?(white_rook)
        expect(result).to be false
      end
    end
    context 'rook moved, and no obstructions' do
      it 'returns false' do
        black_rook.first_move = 'false'
        result = black_king.can_castle?(black_rook)
        expect(result).to be false
      end
      it 'returns false' do
        white_rook.first_move = 'false'
        result = white_king.can_castle?(white_rook)
        expect(result).to be false
      end
    end
  end

  describe '#castle!' do
    let(:black_king) { build(:king, x: 'E', y: 8, color: 'black') }
    let(:black_rook) { build(:rook, x: 'A', y: 8, color: 'black') }
    let(:white_king) { build(:king, x: 'E', y: 1, color: 'white') }
    let(:white_rook) { build(:rook, x: 'A', y: 1, color: 'white') }

    context 'queenside' do
      it 'black king moves 2 spaces to the left and black rook moves to the right of the king' do
        black_king.castle!(black_rook)
        expect(black_king.x).to eq('C')
        expect(black_king.y).to eq(8)
        expect(black_rook.x).to eq('D')
        expect(black_rook.y).to eq(8)
      end
      it 'white king moves 2 spaces to the left and white rook moves to the right of the king' do
        white_king.castle!(white_rook)
        expect(white_king.x).to eq('C')
        expect(white_king.y).to eq(1)
        expect(white_rook.x).to eq('D')
        expect(white_rook.y).to eq(1)
      end
    end
    context 'kingside' do
      it 'black king moves 2 spaces to the right and black rook moves to the left of the king' do
        black_rook.update(x: 'H', y: '8')
        black_king.castle!(black_rook)
        expect(black_king.x).to eq('G')
        expect(black_king.y).to eq(8)
        expect(black_rook.x).to eq('F')
        expect(black_king.y).to eq(8)
      end
      it 'white king moves 2 spaces to the left and white rook moves to the right of the king' do
        white_rook.update(x: 'H', y: '1')
        white_king.castle!(white_rook)
        expect(white_king.x).to eq('G')
        expect(white_king.y).to eq(1)
        expect(white_rook.x).to eq('F')
        expect(white_rook.y).to eq(1)
      end
    end
  end

  describe '#valid_move?' do
    let(:king) { build(:king, x: 'D', y: 4) }

    context 'given king tries to move more than one step' do
      it 'is not a valid move' do
        result = king.valid_move?('D', 7)
        expect(result).to be false
      end

      it 'is not a valid move' do
        result = king.valid_move?('E', 8)
        expect(result).to be false
      end

      it 'is not a valid move' do
        result = king.valid_move?('B', 6)
        expect(result).to be false
      end

      it 'is not a valid move' do
        result = king.valid_move?('B', 2)
        expect(result).to be false
      end

      it 'is not a valid move' do
        result = king.valid_move?('A', 8)
        expect(result).to be false
      end

      it 'is not a valid move' do
        result = king.valid_move?('C', 1)
        expect(result).to be false
      end
    end

    context 'given king has a successful move path' do
      it 'can move the king vertically' do
        result = king.valid_move?('D', 5)
        expect(result).to be true
      end

      it 'can move the king vertically' do
        result = king.valid_move?('D', 3)
        expect(result).to be true
      end

      it 'can move the king diagonally' do
        result = king.valid_move?('C', 3)
        expect(result).to be true
      end

      it 'can move the king diagonally' do
        result = king.valid_move?('C', 5)
        expect(result).to be true
      end

      it 'can move the king diagonally' do
        result = king.valid_move?('E', 3)
        expect(result).to be true
      end

      it 'can move the king diagonally' do
        result = king.valid_move?('E', 5)
        expect(result).to be true
      end

      it 'can move the king horizontally' do
        result = king.valid_move?('C', 4)
        expect(result).to be true
      end

      it 'can move the king horizontally' do
        result = king.valid_move?('E', 4)
        expect(result).to be true
      end
    end
  end
end
