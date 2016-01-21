require 'rails_helper'

RSpec.describe Queen, type: :model do

  describe "#valid_move?" do

  	let(:white_queen) { build(:queen, color: "white", x: "D", y: 1, game_id: 9) }
 		let(:black_queen) { build(:queen, color: "black", x: "D", y: 8, game_id: 9) }
    let(:white_pawn)  { build(:pawn, color: "white", x: "D", y: 2, game_id: 9)}
    let(:white_pawn_2)  { build(:pawn, color: "white", x: "D", y: 2, game_id: 8)}    

 		it "white queen can move vertically" do
 			result = white_queen.valid_move?('D', 4)
 			expect(result).to be true
  	end

  	it "white queen can't move with obstruction" do
      create(:pawn, x: 'D', y: 2)
 			result = white_queen.valid_move?('D', 3)
 			expect(result).to be false
  	end

    it "white queen - checking obstruction function must check the piece belonging to the same game" do
      create(:pawn, x: 'D', y: 2, game_id: 8)
      result = white_queen.valid_move?('D', 3)
      expect(result).to be true
    end
 
  	it "white queen can move diagonally" do
 			result = white_queen.valid_move?('F', 3)
 			expect(result).to be true
  	end

 		it "black queen can move vertically" do
 			result = black_queen.valid_move?('D', 5)
 			expect(result).to be true
  	end

  	it "black queen can move horizontally" do
 			result = black_queen.valid_move?('G', 8)
 			expect(result).to be true
  	end
 
  	it "black queen can move diagonally" do
 			result = black_queen.valid_move?('B', 6)
 			expect(result).to be true
  	end  

  	# it "white queen cannot move to it's current position" do
 		# 	result = white_queen.valid_move?('D', 1)
 		# 	expect(result).to be false
  	# end

  	# it "black queen cannot move to it's current position" do
 		# 	result = black_queen.valid_move?('D', 8)
 		# 	expect(result).to be false
  	# end

  	# it "white queen cannot move to a non valid position" do
 		# 	result = white_queen.valid_move?('C', 3)
 		# 	expect(result).to be false
  	# end
 
  	# it "black queen cannot move to a non valid position" do
 		# 	result = black_queen.valid_move?('E', 6)
 		# 	expect(result).to be false
  	# end

  end
end
