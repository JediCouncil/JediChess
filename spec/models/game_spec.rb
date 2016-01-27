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

 describe "#check?" do
    game = FactoryGirl.create(:game)
=begin
    it 'returns false if the game is not in check' do
        expect(game.check?).to eq false #should return false if the game stays at starting state
    end
=end
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
