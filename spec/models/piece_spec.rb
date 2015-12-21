require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe '#is_obstructed' do
    let(:piece)  { build(:piece) }
    let(:piece2) { build(:piece) }


    context 'a piece is on destination' do
      it 'returns false' do
        piece.x = "A"
        piece.y =  6
        piece.save!

        piece2.x = "C"
        piece2.y =  4
        piece2.save!

        result = piece.is_obstructed("C", 4)
        expect(result).to be false
      end
      it 'returns false' do
        piece.x = "A"
        piece.y = "8"
        piece.save!

        piece2.x = "A"
        piece2.y = "6"
        piece2.save!

        result = piece.is_obstructed("A", 6)
        expect(result).to be false
      end
    end

    context 'piece is obstructed' do
      it 'returns true' do
        piece.x = "F"
        piece.y =  1
        piece.save!

        piece2.x = "E"
        piece2.y =  2
        piece2.save!

        result = piece.is_obstructed("D", 3)
        expect(result).to be true
      end

      it 'returns true' do
        piece.x = "A"
        piece.y = "1"
        piece.save!

        piece2.x = "A"
        piece2.y = "2"
        piece2.save!

        result = piece.is_obstructed("A", 4)
        expect(result).to be true
      end
    end

    context 'invalid move' do
      it 'raises an error' do
        piece.x = "D"
        piece.y =  4
        piece.save!

        invalid_move = "Invalid input. Not diagonal, horizontal, or vertical"
        expect(piece.is_obstructed("B", 5)).to raise_error(invalid_move)
      end
    end


    context 'piece is not obstructed' do
      it 'returns false' do
        piece.x = "A"
        piece.y = "8"
        piece.save!

        result = piece.is_obstructed("C", 8)
        expect(result).to be false
      end
    end
  end
end
