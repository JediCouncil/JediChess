require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe '#is_obstructed?' do
    let(:piece)  { build(:piece) }
    let(:piece2) { build(:piece) }

    context 'a piece is on destination' do
      it 'returns false' do
        piece.update(x: 'A', y: 6)
        piece2.update(x: 'C', y: 4)

        result = piece.is_obstructed?('C', 4)
        expect(result).to be false
      end
      it 'returns false' do
        piece.update(x: 'A', y: 8)
        piece2.update(x: 'A', y: 6)

        result = piece.is_obstructed?('A', 6)
        expect(result).to be false
      end
    end

    context 'piece is obstructed' do
      it 'returns true' do
        piece.update(x: 'A', y: 2)
        piece2.update(x: 'C', y: 4)

        result = piece.is_obstructed?('E', 6)
        expect(result).to be true
      end

      it 'returns true' do
        piece.update(x: 'F', y: 1)
        piece2.update(x: 'E', y: 2)

        result = piece.is_obstructed?('D', 3)
        expect(result).to be true
      end

      it 'returns true' do
        piece.update(x: 'B', y: 3)
        piece2.update(x: 'E', y: 3)

        result = piece.is_obstructed?('H', 3)
        expect(result).to be true
      end

      it 'returns true' do
        piece.update(x: 'A', y: 1)
        piece2.update(x: 'A', y: 2)

        result = piece.is_obstructed?('A', 4)
        expect(result).to be true
      end
    end

    context 'invalid move' do
      it 'raises an error if input is invalid' do
        piece.update(x: 'D', y: 4)

        invalid_move = 'Invalid input. Not diagonal, horizontal, or vertical'
        expect { piece.is_obstructed?('B', 5) }.to raise_error { invalid_move }
      end
      it 'raises an error' do
        piece.update(x: 'D', y: 4)

        invalid_move = 'Invalid input. Not diagonal, horizontal, or vertical'
        expect { piece.is_obstructed?('H', 3) }.to raise_error { invalid_move }
      end
    end

    context 'piece is not obstructed' do
      it 'returns false' do
        piece.update(x: 'A', y: 8)

        result = piece.is_obstructed?('C', 8)
        expect(result).to be false
      end
      it 'returns false' do
        piece.update(x: 'B', y: 6)

        result = piece.is_obstructed?('G', 6)
        expect(result).to be false
      end
      it 'returns false' do
        piece.update(x: 'E', y: 2)

        result = piece.is_obstructed?('H', 5)
        expect(result).to be false
      end
    end
  end

  describe '#move_to!' do
    let(:piece)  { build(:piece) }
    let(:piece2) { build(:piece) }

    context 'enemy piece' do
      it 'piece2 destroyed and piece has updated xy coordinates' do
        piece.update(x: 'H', y: 1, color: 'black')
        piece2.update(x: 'H', y: 4, color: 'white')

        expect { piece.move_to!('H', 4) }.to change { Piece.count }.from(2).to(1)
        expect(piece).to have_attributes(x: 'H', y: 4)
      end
      it 'piece2 destroyed and piece has updated xy coordinates' do
        piece.update(x: 'A', y: 2, color: 'white')
        piece2.update(x: 'A', y: 6, color: 'black')

        expect { piece.move_to!('A', 6) }.to change { Piece.count }.from(2).to(1)
        expect(piece).to have_attributes(x: 'A', y: 6)
      end
    end

    context 'our piece' do
      it 'piece2 not destroyed and piece has same xy coordinates' do
        piece.update(x: 'E', y: 2, color: 'black')
        piece2.update(x: 'E', y: 4, color: 'black')

        expect { piece.move_to!('E', 4) }.to_not change { Piece.count }
        expect(piece).to have_attributes(x: 'E', y: 2)
      end
      it 'piece2 not destroyed and piece has same xy coordinates' do
        piece.update(x: 'D', y: 7, color: 'white')
        piece2.update(x: 'D', y: 4, color: 'white')

        expect { piece.move_to!('D', 4) }.to_not change { Piece.count }
        expect(piece).to have_attributes(x: 'D', y: 7)
      end
    end
    context 'no piece' do
      it 'piece has updated xy coordinates' do
        piece.update(x: 'G', y: 2, color: 'black')

        expect { piece.move_to!('D', 5) }.to_not change { Piece.count }
        expect(piece).to have_attributes(x: 'D', y: 5)
      end
      it 'piece has updated xy coordinates' do
        piece.update(x: 'B', y: 3, color: 'white')

        expect { piece.move_to!('E', 3) }.to_not change { Piece.count }
        expect(piece).to have_attributes(x: 'E', y: 3)
      end
    end
  end

  describe '#move!' do
    let (:piece) { create(:king, color: 'white', x: 'D', y: 3) }
    let (:piece2) { create(:knight, color: 'black', x: 'B', y: 7) }
    let (:piece3) { create(:pawn, color: 'black', x: 'B', y: 2) }
    let (:piece4) { create(:rook, color: 'black', x: 'H', y: 6) }
    let (:piece5) { create(:queen, color: 'white', x: 'G', y: 4) }
    let (:piece6) { create(:bishop, color: 'white', x: 'F', y: 2) }

    context 'given piece is a king' do
      it 'moves if valid' do
        piece.move!('D', 4)
        expect(piece).to have_attributes(x: 'D', y: 4)
      end
    end

    context 'given piece is a king' do
      it 'does not move if invalid' do
        piece.move!('F', 1)
        expect(piece).to have_attributes(x: 'D', y: 3)
      end
    end

    context 'given piece is a knight' do
      it 'does move if valid' do
        piece2.move!('D', 6)
        expect(piece2).to have_attributes(x: 'D', y: 6)
      end
    end

    context 'given piece is a knight' do
      it 'does not move if invalid' do
        piece2.move!('H', 3)
        expect(piece2).to have_attributes(x: 'B', y: 7)
      end
    end

    context 'given piece is a pawn' do
      it 'does move if valid' do
        piece3.move!('B', 3)
        expect(piece3).to have_attributes(x: 'B', y: 3)
      end
    end

    context 'given piece is a pawn' do
      it 'does not move if invalid' do
        piece3.move!('A', 3)
        expect(piece3).to have_attributes(x: 'B', y: 2)
      end
    end

    context 'given piece is a rook' do
      it 'does move if valid' do
        piece4.move!('H', 1)
        expect(piece4).to have_attributes(x: 'H', y: 1)
      end
    end

    context 'given piece is a rook' do
      it 'does not move if invalid' do
        piece4.move!('G', 5)
        expect(piece4).to have_attributes(x: 'H', y: 6)
      end
    end

    context 'given piece is a queen' do
      it 'does move if valid' do
        piece5.move!('G', 2)
        expect(piece5).to have_attributes(x: 'G', y: 2)
      end
    end

    context 'given piece is a queen' do
      it 'does not move if invalid' do
        piece5.move!('C', 4)
        expect(piece5).to have_attributes(x: 'G', y: 4)
      end
    end

    context 'given piece is a bishop' do
      it 'does move if valid' do
        piece6.move!('G', 3)
        expect(piece6).to have_attributes(x: 'G', y: 3)
      end
    end

    context 'given piece is a bishop' do
      it 'does not move if invalid' do
        piece6.move!('F', 4)
        expect(piece6).to have_attributes(x: 'F', y: 2)
      end
    end
  end
end
