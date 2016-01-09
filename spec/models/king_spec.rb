require 'rails_helper'

RSpec.describe King, type: :model do
  describe "#can_castle" do
    let(:black_king) { build(:king, x: 'E', y: 8, color: 'black') }
    let(:black_rook) { build(:rook, x: 'A', y: 8, color: 'black') }
    let(:white_king) { build(:king, x: 'E', y: 1, color: 'white') }
    let(:white_rook) { build(:rook, x: 'A', y: 1, color: 'white') }

    context "king and rook unmoved and no obstructions" do
      it "returns true" do
        result = black_king.can_castle?(black_rook)
        expect(result).to be true
      end
       it "returns true" do
        result = white_king.can_castle?(white_rook)
        expect(result).to be true
      end
    end
    context "king moved, and no obstructions" do
      it "returns false" do
        black_king.first_move = "false"
        result = black_king.can_castle?(black_rook)
        expect(result).to be false
      end
       it "returns false" do
        white_king.first_move = "false"
        result = white_king.can_castle?(white_rook)
        expect(result).to be false
      end
    end
    context "rook moved, and no obstructions" do
      it "returns false" do
        black_rook.first_move = "false"
        result = black_king.can_castle?(black_rook)
        expect(result).to be false
      end
      it "returns false" do
        white_rook.first_move = "false"
        result = white_king.can_castle?(white_rook)
        expect(result).to be false
      end
    end
  end
end

