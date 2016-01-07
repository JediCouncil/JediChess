require 'rails_helper'

RSpec.describe King, type: :model do

  describe '#valid_move?' do
    let(:king)  { build(:king, x: 'D' , y: 4) }

    context 'given king tries to move more than one step' do
      it 'is not a valid move' do
        result = king.valid_move?('D', 7)
        expect(result).to be false
      end
    end

    context 'given king has a successful move path' do
      it 'can move the king vertically' do
        result = king.valid_move?('D', 5)
        expect(result).to be true
      end

      it 'can move the king diagonally' do
        result = king.valid_move?('C', 3)
        expect(result).to be true
      end

      it 'can move the king horizontally' do
        result = king.valid_move?('C', 4)
        expect(result).to be true
      end
    end
  end    
end