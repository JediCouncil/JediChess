

RSpec.describe Piece, type: :model do
  describe '#is_obstructed?' do
    let(:piece)  { build(:piece) }
    let(:piece2) { build(:piece) }


    context 'a piece is on destination' do
      it 'returns false' do
        piece.update(x: 'A', y: 6)
        piece2.update(x: 'C', y: 4)

        result = piece.is_obstructed?("C", 4)
        expect(result).to be false
      end
      it 'returns false' do
        piece.update(x: 'A', y: 8)
        piece2.update(x: 'A', y: 6)

        result = piece.is_obstructed?("A", 6)
        expect(result).to be false
      end
    end

    context 'piece is obstructed' do
      it 'returns true' do
        piece.update(x: 'A', y: 2)
        piece2.update(x: 'C', y: 4)

        result = piece.is_obstructed?("E", 6)
        expect(result).to be true
      end

      it 'returns true' do
        piece.update(x: 'F', y: 1)
        piece2.update(x: 'E', y: 2)

        result = piece.is_obstructed?("D", 3)
        expect(result).to be true
      end

      it 'returns true' do
        piece.update(x: 'B', y: 3)
        piece2.update(x: 'E', y: 3)

        result = piece.is_obstructed?("H", 3)
        expect(result).to be true
      end

      it 'returns true' do
        piece.update(x: 'A', y: 1)
        piece2.update(x: 'A', y: 2)

        result = piece.is_obstructed?("A", 4)
        expect(result).to be true
      end
    end

    context 'invalid move' do
      it 'raises an error if input is invalid' do
        piece.update(x: 'D', y: 4)

        invalid_move = "Invalid input. Not diagonal, horizontal, or vertical"
        expect { piece.is_obstructed?("B", 5) }.to raise_error { invalid_move }
      end
       it 'raises an error' do
        piece.update(x: 'D', y: 4)

        invalid_move = "Invalid input. Not diagonal, horizontal, or vertical"
        expect { piece.is_obstructed?("H", 3) }.to raise_error { invalid_move }
      end
    end


    context 'piece is not obstructed' do
      it 'returns false' do
        piece.update(x: 'A', y: 8)

        result = piece.is_obstructed?("C", 8)
        expect(result).to be false
      end
      it 'returns false' do
        piece.update(x: 'B', y: 6)

        result = piece.is_obstructed?("G", 6)
        expect(result).to be false
      end
      it 'returns false' do
        piece.update(x: 'E', y: 2)

        result = piece.is_obstructed?("H", 5)
        expect(result).to be false
      end
    end
  end
end
