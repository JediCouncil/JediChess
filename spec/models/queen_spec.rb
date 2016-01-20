require 'rails_helper'

RSpec.describe Queen, type: :model do

  describe "#valid_move?" do
  	let(:white_queen) { build(:queen, color: "white", x: "d", y: 1) }
 		let(:black_queen) { build(:queen, color: "black", x: "d", y: 8) }
    let(:white_pawn)  { build(:pawn, color: "white", x: "d", y: 2)}  

 		it "white queen can move vertically" do
 			result = white_queen.valid_move?('d', 4)
 			expect(result).to be true
  	end

  	# it "white queen can't move with obstruction" do
   #    create(:pawn, x: 'A', y: 2)
 		# 	result = white_queen.valid_move?('d', 3)
 		# 	expect(result).to be false
  	# end
 
  	it "white queen can move diagonally" do
 			result = white_queen.valid_move?('f', 3)
 			expect(result).to be true
  	end

 		it "black queen can move vertically" do
 			result = black_queen.valid_move?('d', 5)
 			expect(result).to be true
  	end

  	it "black queen can move horizontally" do
 			result = black_queen.valid_move?('g', 8)
 			expect(result).to be true
  	end
 
  	it "black queen can move diagonally" do
 			result = black_queen.valid_move?('b', 6)
 			expect(result).to be true
  	end  

  	it "white queen cannot move to it's current position" do
 			result = white_queen.valid_move?('d', 1)
 			expect(result).to be false
  	end

  	it "black queen cannot move to it's current position" do
 			result = black_queen.valid_move?('d', 8)
 			expect(result).to be false
  	end

  	it "white queen cannot move to a non valid position" do
 			result = white_queen.valid_move?('c', 3)
 			expect(result).to be false
  	end
 
  	it "black queen cannot move to a non valid position" do
 			result = black_queen.valid_move?('e', 6)
 			expect(result).to be false
  	end
  end



end
