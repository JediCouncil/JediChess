require 'rails_helper'

RSpec.describe Game, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

RSpec.describe Game, type: :model do
  it "populate board" do
  	Game.populate_board!
  	expect(Game.pieces.x(:type => 'rook', :color=>'white')).to eq('a')
  	expect(Game.pieces.y(:type => 'rook', :color=>'white')).to eq(1)
  	expect(Game.pieces.x(:type => 'knight', :color=>'white')).to eq('b')
  	expect(Game.pieces.y(:type => 'knight', :color=>'white')).to eq(1)
  end 
end

