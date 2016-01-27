require 'rails_helper'

RSpec.describe Game, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

RSpec.describe Game, type: :model do
  it 'populate board' do
    game = FactoryGirl.create(:game)

    expect(game.pieces.select('type').where(x: 'A', y: 1).first.type).to eq('Rook')
    expect(game.pieces.select('type').where(x: 'B', y: 1).first.type).to eq('Knight')
    expect(game.pieces.select('type').where(x: 'C', y: 1).first.type).to eq('Bishop')
    expect(game.pieces.select('type').where(x: 'D', y: 1).first.type).to eq('Queen')
    expect(game.pieces.select('type').where(x: 'E', y: 1).first.type).to eq('King')
    expect(game.pieces.select('type').where(x: 'F', y: 1).first.type).to eq('Bishop')
    expect(game.pieces.select('type').where(x: 'G', y: 1).first.type).to eq('Knight')
    expect(game.pieces.select('type').where(x: 'H', y: 1).first.type).to eq('Rook')

    expect(game.pieces.select('type').where(x: 'A', y: 2).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'B', y: 2).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'C', y: 2).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'D', y: 2).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'E', y: 2).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'F', y: 2).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'G', y: 2).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'H', y: 2).first.type).to eq('Pawn')

    expect(game.pieces.select('type').where(x: 'A', y: 8).first.type).to eq('Rook')
    expect(game.pieces.select('type').where(x: 'B', y: 8).first.type).to eq('Knight')
    expect(game.pieces.select('type').where(x: 'C', y: 8).first.type).to eq('Bishop')
    expect(game.pieces.select('type').where(x: 'D', y: 8).first.type).to eq('Queen')
    expect(game.pieces.select('type').where(x: 'E', y: 8).first.type).to eq('King')
    expect(game.pieces.select('type').where(x: 'F', y: 8).first.type).to eq('Bishop')
    expect(game.pieces.select('type').where(x: 'G', y: 8).first.type).to eq('Knight')
    expect(game.pieces.select('type').where(x: 'H', y: 8).first.type).to eq('Rook')

    expect(game.pieces.select('type').where(x: 'A', y: 7).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'B', y: 7).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'C', y: 7).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'D', y: 7).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'E', y: 7).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'F', y: 7).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'G', y: 7).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'H', y: 7).first.type).to eq('Pawn')
  end
end
