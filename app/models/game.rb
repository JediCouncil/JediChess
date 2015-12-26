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

	def populate_board!
		pieces.create(:x=>'a', :y=>'1',:type=>'rook', :color=>'white')
		pieces.create(:x=>'b', :y=>'1', :type=>'knight', :color=>'white')
		pieces.create(:x=>'c', :y=>'1', :type=>'bishop', :color=>'white')
		pieces.create(:x=>'d', :y=>'1', :type=>'queen', :color=>'white')
		pieces.create(:x=>'e', :y=>'1', :type=>'king', :color=>'white')
		pieces.create(:x=>'f', :y=>'1', :type=>'bishop', :color=>'white')
		pieces.create(:x=>'g', :y=>'1', :type=>'knight', :color=>'white')
		pieces.create(:x=>'h', :y=>'1', :type=>'rook', :color=>'white')
		pieces.create(:x=>'a', :y=>'2', :type=>'pawn', :color=>'white')
		pieces.create(:x=>'b', :y=>'2', :type=>'pawn', :color=>'white')
		pieces.create(:x=>'c', :y=>'2', :type=>'pawn', :color=>'white')
		pieces.create(:x=>'d', :y=>'2', :type=>'pawn', :color=>'white')
		pieces.create(:x=>'e', :y=>'2', :type=>'pawn', :color=>'white')
		pieces.create(:x=>'f', :y=>'2', :type=>'pawn', :color=>'white')
		pieces.create(:x=>'g', :y=>'2', :type=>'pawn', :color=>'white')
		pieces.create(:x=>'h', :y=>'2', :type=>'pawn', :color=>'white')

		pieces.create(:x=>'a', :y=>'8',:type=>'rook', :color=>'black')
		pieces.create(:x=>'b', :y=>'8', :type=>'knight', :color=>'black')
		pieces.create(:x=>'c', :y=>'8', :type=>'bishop', :color=>'black')
		pieces.create(:x=>'d', :y=>'8', :type=>'queen', :color=>'black')
		pieces.create(:x=>'e', :y=>'8', :type=>'king', :color=>'black')
		pieces.create(:x=>'f', :y=>'8', :type=>'bishop', :color=>'black')
		pieces.create(:x=>'g', :y=>'8', :type=>'knight', :color=>'black')
		pieces.create(:x=>'h', :y=>'8', :type=>'rook', :color=>'black')
		pieces.create(:x=>'a', :y=>'7', :type=>'pawn', :color=>'black')
		pieces.create(:x=>'b', :y=>'7', :type=>'pawn', :color=>'black')
		pieces.create(:x=>'c', :y=>'7', :type=>'pawn', :color=>'black')
		pieces.create(:x=>'d', :y=>'7', :type=>'pawn', :color=>'black')
		pieces.create(:x=>'e', :y=>'7', :type=>'pawn', :color=>'black')
		pieces.create(:x=>'f', :y=>'7', :type=>'pawn', :color=>'black')
		pieces.create(:x=>'g', :y=>'7', :type=>'pawn', :color=>'black')
		pieces.create(:x=>'h', :y=>'7', :type=>'pawn', :color=>'black')
		
	end


end
