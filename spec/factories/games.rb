define do
	factory :game do

	end
	game = create(:game)
	game.pieces.where(type: 'rook').white.x
end