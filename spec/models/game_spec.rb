require 'rails_helper'

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

  context 'set up a check and no escape situation' do
    game = FactoryGirl.create(:game)

    game.pieces.where(type: 'Pawn', color: 0).delete_all
    game.pieces.find_by(type: 'King', color: 0).update(x: 'D', y: 5)
    game.pieces.find_by(type: 'Rook', color: 1).update(x: 'A', y: 5)
    game.pieces.find_by(type: 'Queen', color: 1).update(x: 'B', y: 3)
    game.pieces.find_by(type: 'Knight', color: 1, x:'B', y: 1).update(x: 'B', y: 4)
    game.pieces.find_by(type: 'Bishop', color: 1).update(x: 'F', y: 3)
    game.pieces.find_by(type: 'Knight', color: 1, x:'G', y: 1).update(x: 'F', y: 5)

    it 'black king is checked by 4 pieces' do
      result = game.check?
      expect(result).to be true
    end

    it 'black king is checkmated by 5 pieces' do
      result = game.checkmate?
      expect(result).to be true
    end
  end

  context 'set up a check and can block to escape situation' do
    game = FactoryGirl.create(:game)

    game.pieces.find_by(x:'A', y: 8).delete
    game.pieces.find_by(x:'C', y: 8).delete
    game.pieces.find_by(x:'D', y: 8).delete
    game.pieces.find_by(type: 'Knight', color: 0).move_to!('C',6)
    game.pieces.find_by(type: 'King', color: 0).move_to!('A', 8)
    game.pieces.find_by(type: 'Rook', color: 1).move_to!('C', 8)

    it 'black king is checked by 1 piece' do
      result = game.check?
      expect(result).to be true
    end

    it 'black king can get out of checkmate saved by Knight ' do
      result = game.checkmate?
      expect(result).to be false
    end
  end
end
