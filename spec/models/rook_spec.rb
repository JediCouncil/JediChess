require 'rails_helper'

RSpec.describe Rook, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe "#valid_move?" do
  	
  		let(:white_rook) { build(:rook, color: "white", x: "A", y: 1) }
  		let(:black_rook) { build(:rook, color: "black", x: "H", y: 8) }

  		it "white rook can move vertically" do
  			result = white_rook.valid_move?('A', 2)
  			expect(result).to be true
  		end

  		it "black rook can move vertically" do
  			result = black_rook.valid_move?('H', 5)
  			expect(result).to be true
  		end

  		it "white rook can move horizontally" do
  			result = white_rook.valid_move?('B', 1)
  			expect(result).to be true
  		end

  		it "black rook can move horizontally" do
  			result = black_rook.valid_move?('F', 8)
  			expect(result).to be true
  		end

  		it "can't move diagonally" do
  			result = white_rook.valid_move?('B', 2)
  			expect(result).to be false
  		end

  		it "can't move if obstructed" do
  			create(:pawn, x: 'A', y: 2)
  			result = white_rook.valid_move?('A', 3)
  			expect(result).to be false
  		end
 


  end
end
