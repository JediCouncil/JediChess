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

 describe "#check?" do
    game = FactoryGirl.create(:game)
    it 'returns false if the game is not in check' do
        expect(game.check?).to eq false #should return false if the game stays at starting state
    end

    it 'returns true if the Queen is threatening' do
        Pawn.destroy_all(game: game) #removes all pawns from game
        #to make room for threatening queen
        #makes queen directly vertical to white king]

        create(:queen, x: 'E', y: '7', color: 'black', game: game)

        expect(game.check?).to eq true
    end

    it 'returns true if a Pawn is threatening' do
        Pawn.destroy_all(game: game, color: 'white') #removes all white pawns

        create(:pawn, x: 'D', y: '2', color: 'black', game: game)

        expect(game.check?).to eq true
    end
end

end
