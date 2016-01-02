require 'rails_helper'

RSpec.describe Pawn, type: :model do
  describe "#valid_move?" do
    let(:pawn) { build(:pawn) }

    context "first move" do
      it "can move 2 spaces" do
      end

      it "can move 1 space" do
      end

      it "can't move 3 spaces" do
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
