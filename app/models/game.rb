class Game < ActiveRecord::Base


	has_and_belongs_to_many :user
	has_many :pieces
	belongs_to :type

	after_create :populate_board!

	scope :available, -> {
		joins(:users).
		group('games.id').
		having('count(id) = 1')
	}

	private
	def populate_board!
		Piece.create(:x=>'a', :y=>'1', :type=>'rook', :color=>'white')
		Piece.create(:x=>'b', :y=>'1', :type=>'knight', :color=>'white')
		Piece.create(:x=>'c', :y=>'1', :type=>'bishop', :color=>'white')
		Piece.create(:x=>'d', :y=>'1', :type=>'queen', :color=>'white')
		Piece.create(:x=>'e', :y=>'1', :type=>'king', :color=>'white')
		Piece.create(:x=>'f', :y=>'1', :type=>'bishop', :color=>'white')
		Piece.create(:x=>'g', :y=>'1', :type=>'knight', :color=>'white')
		Piece.create(:x=>'h', :y=>'1', :type=>'rook', :color=>'white')
		Piece.create(:x=>'a', :y=>'2', :type=>'pawn', :color=>'white')
		Piece.create(:x=>'b', :y=>'2', :type=>'pawn', :color=>'white')
		Piece.create(:x=>'c', :y=>'2', :type=>'pawn', :color=>'white')
		Piece.create(:x=>'d', :y=>'2', :type=>'pawn', :color=>'white')
		Piece.create(:x=>'e', :y=>'2', :type=>'pawn', :color=>'white')
		Piece.create(:x=>'f', :y=>'2', :type=>'pawn', :color=>'white')
		Piece.create(:x=>'g', :y=>'2', :type=>'pawn', :color=>'white')
		Piece.create(:x=>'h', :y=>'2', :type=>'pawn', :color=>'white')


		Piece.create(:x=>'a', :y=>'8',:type=>'rook', :color=>'black')
		Piece.create(:x=>'b', :y=>'8', :type=>'knight', :color=>'black')
		Piece.create(:x=>'c', :y=>'8', :type=>'bishop', :color=>'black')
		Piece.create(:x=>'d', :y=>'8', :type=>'queen', :color=>'black')
		Piece.create(:x=>'e', :y=>'8', :type=>'king', :color=>'black')
		Piece.create(:x=>'f', :y=>'8', :type=>'bishop', :color=>'black')
		Piece.create(:x=>'g', :y=>'8', :type=>'knight', :color=>'black')
		Piece.create(:x=>'h', :y=>'8', :type=>'rook', :color=>'black')
		Piece.create(:x=>'a', :y=>'7', :type=>'pawn', :color=>'black')
		Piece.create(:x=>'b', :y=>'7', :type=>'pawn', :color=>'black')
		Piece.create(:x=>'c', :y=>'7', :type=>'pawn', :color=>'black')
		Piece.create(:x=>'d', :y=>'7', :type=>'pawn', :color=>'black')
		Piece.create(:x=>'e', :y=>'7', :type=>'pawn', :color=>'black')
		Piece.create(:x=>'f', :y=>'7', :type=>'pawn', :color=>'black')
		Piece.create(:x=>'g', :y=>'7', :type=>'pawn', :color=>'black')
		Piece.create(:x=>'h', :y=>'7', :type=>'pawn', :color=>'black')


		
	end


end
