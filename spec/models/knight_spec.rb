require 'rails_helper'

RSpec.describe Knight, type: :model do
  describe '#valid_move?' do
    let(:knight)  { build(:knight, x: 'C' , y: 4) }

    context 'given knight moves properly' do
      it 'is a valid move' do
        result = knight.valid_move?('D', 6)
        expect(result).to be true
      end

      it 'is a valid move' do
        result = knight.valid_move?('B', 2)
        expect(result).to be true
      end

      it 'is a valid move' do
        result = knight.valid_move?('A', 3)
        expect(result).to be true
      end

      it 'is a valid move' do
        result = knight.valid_move?('E', 5)
        expect(result).to be true
      end

      it 'is a valid move' do
        result = knight.valid_move?('B', 6)
        expect(result).to be true
      end

      it 'is a valid move' do
        result = knight.valid_move?('A', 5)
        expect(result).to be true
      end

      it 'is a valid move' do
        result = knight.valid_move?('D', 2)
        expect(result).to be true
      end

      it 'is a valid move' do
        result = knight.valid_move?('E', 3)
        expect(result).to be true
      end
    end

    context 'given knight doesn\'t move properly' do
      it 'is not a valid move' do
        result = knight.valid_move?('H', 3)
        expect(result).to be false
      end

      it 'is not a valid move' do
        result = knight.valid_move?('C', 8)
        expect(result).to be false
      end

      it 'is not a valid move' do
        result = knight.valid_move?('A', 1)
        expect(result).to be false
      end

      it 'is not a valid move' do
        result = knight.valid_move?('C', 3)
        expect(result).to be false
      end

      it 'is not a valid move' do
        result = knight.valid_move?('E', 4)
        expect(result).to be false
      end

      it 'is not a valid move' do
        result = knight.valid_move?('B', 5)
        expect(result).to be false
      end
    end
  end
end