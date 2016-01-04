RSpec.describe King, type: :model do

  describe '#valid_move?' do
    let(:king)  { build(:king, x: 'D' , y: 4) }
    let(:piece) { build(:piece, x: 'D', y: 3) }

    context 'the king is_obstructed' do
      it 'will not move' do
        result = king.valid_move?('D', 3)
        expect(result).to be false
      end
    end

    context 'the king tries to move more than one step' do
      it 'will not move' do
        result = king.valid_move?('D', 7)
        expect(result).to be false
      end
    end

    context 'the king has a successful move' do
      it 'moves the king vertically' do
        result = king.valid_move?('D', 5)
        expect(result).to be true
      end

      it 'moves the king diagonally' do
        result = king.valid_move?('C', 3)
        expect(result).to be true
      end

      it 'moves the king horizontally' do
        result = king.valid_move?('C', 4)
        expect(result).to be true
      end
    end
  end    
end