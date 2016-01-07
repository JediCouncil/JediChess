require 'rails_helper'

RSpec.describe Rook, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe "#valid_move?" do
  	context "move" do
  		let(:white_rook) { build(:rook, color: "white", x: "A", y: 1) }
  		let(:black_rook) { build(:rook, color: "black", x: "H", y: 8) }

  		it "white rook can move vertically" do
  			result = white_rook.valid_move?('A', 2)
  			result.should == true
  		end

  		it "white rookcan move more than 1 space" do
  			result = white_rook.valid_move?('C', 1)
  			result.should == true
  		end
  	end
end
