require 'rails_helper'

RSpec.describe Game, type: :model do
  it 'populate board' do
    game = FactoryGirl.create(:game)

    expect(game.pieces.select('type').where(x: 'a', y: 1).first.type).to eq('Rook')
    expect(game.pieces.select('type').where(x: 'b', y: 1).first.type).to eq('Knight')
    expect(game.pieces.select('type').where(x: 'c', y: 1).first.type).to eq('Bishop')
    expect(game.pieces.select('type').where(x: 'd', y: 1).first.type).to eq('Queen')
    expect(game.pieces.select('type').where(x: 'e', y: 1).first.type).to eq('King')
    expect(game.pieces.select('type').where(x: 'f', y: 1).first.type).to eq('Bishop')
    expect(game.pieces.select('type').where(x: 'g', y: 1).first.type).to eq('Knight')
    expect(game.pieces.select('type').where(x: 'h', y: 1).first.type).to eq('Rook')

    expect(game.pieces.select('type').where(x: 'a', y: 2).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'b', y: 2).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'c', y: 2).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'd', y: 2).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'e', y: 2).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'f', y: 2).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'g', y: 2).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'h', y: 2).first.type).to eq('Pawn')

    expect(game.pieces.select('type').where(x: 'a', y: 8).first.type).to eq('Rook')
    expect(game.pieces.select('type').where(x: 'b', y: 8).first.type).to eq('Knight')
    expect(game.pieces.select('type').where(x: 'c', y: 8).first.type).to eq('Bishop')
    expect(game.pieces.select('type').where(x: 'd', y: 8).first.type).to eq('Queen')
    expect(game.pieces.select('type').where(x: 'e', y: 8).first.type).to eq('King')
    expect(game.pieces.select('type').where(x: 'f', y: 8).first.type).to eq('Bishop')
    expect(game.pieces.select('type').where(x: 'g', y: 8).first.type).to eq('Knight')
    expect(game.pieces.select('type').where(x: 'h', y: 8).first.type).to eq('Rook')

    expect(game.pieces.select('type').where(x: 'a', y: 7).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'b', y: 7).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'c', y: 7).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'd', y: 7).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'e', y: 7).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'f', y: 7).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'g', y: 7).first.type).to eq('Pawn')
    expect(game.pieces.select('type').where(x: 'h', y: 7).first.type).to eq('Pawn')
  end

  describe '#change_turn!' do
    let(:game) { create(:game, white_player_id: 1, black_player_id: 0, turn: 0) }

    context 'given last piece played was black' do
      it 'changes turn to white_player_id' do
        game.change_turn!
        expect(Game.turn).to eq(1)
      end
    end
  end
end
