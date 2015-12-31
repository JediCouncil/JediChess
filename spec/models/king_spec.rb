RSpec.describe King, type: :model do

  describe '#move_king' do
    let(:king)  { build(:king) }

    context 'the king tries to move more than 1 step' do
      it 'returns false' do
      	king.update(x: 'A', y: 6)
      	king.move_king('D', 3)
        
        expect(king.move_king('D', 3)).to be false
      end
    end
  end
end