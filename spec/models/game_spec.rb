require 'rails_helper'

RSpec.describe Game, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

RSpec.describe Game, type: :model do
  it "populate board" do
  	game = FactoryGirl.create(:game)

  	expect(game.pieces.where(:type => 'Rook', :color =>'white', :y =>1).select('x')).to eq(['a', 'h'])
  	# expect(game.pieces.where(:type => 'Rook', :color =>'white').y).to eq(2)
  end 
end

