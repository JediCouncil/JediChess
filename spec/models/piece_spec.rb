require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe '#is_obstructed' do
    #create piece instance
    let(:piece) { create(:piece) }
    #create piece2 instance that will obstruct


    it 'returns not obstructed' do
      #call the is obstructed method with x and y coord on Piece 1
    end

    it 'returns not obstructed' do
    end

    it 'returns obstructed' do
    end

    it 'returns obstructed' do
    end

    it 'raises an invalid input error' do
    end

    it 'returns not obstruction when a piece is in destination' do
    end

  end
end
