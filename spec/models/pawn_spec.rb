require 'rails_helper'

RSpec.describe Pawn, type: :model do
  describe "#valid_move?" do
    let(:white_pawn) { build(:pawn, color: "white") }

    context "first move" do
      let(:black_pawn) { build(:pawn, color: "black", x: 'B', y: 2) }

      it "can move 2 spaces" do
        result = black_pawn.valid_move?('B', 4)
        expect(result).to be true
      end

      it "can move 1 space" do
        result = black_pawn.valid_move?('B', 3)
        expect(result).to be true
      end

      it "can't move 3 spaces" do
        result = black_pawn.valid_move?('B', 5)
        expect(result).to be false
      end
    end
    context "not first move" do
      it "can move 1 space" do
      end

      it "can't move 2 spaces" do
      end

      it "can't move backwards" do
      end
    end
    context "capture" do
      it "can capture one square diagonally" do
      end

      it "can't capture vertically" do
      end

      it "can't capture horizontally" do
      end
    end
  end
end
