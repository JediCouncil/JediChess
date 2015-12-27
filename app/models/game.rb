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
		pieces.create(:x=>'a', :y=>'1', :type=>'Rook', :color=>'white')
		pieces.create(:x=>'b', :y=>'1', :type=>'Knight', :color=>'white')
		pieces.create(:x=>'c', :y=>'1', :type=>'Bishop', :color=>'white')
		pieces.create(:x=>'d', :y=>'1', :type=>'Queen', :color=>'white')
		pieces.create(:x=>'e', :y=>'1', :type=>'King', :color=>'white')
		pieces.create(:x=>'f', :y=>'1', :type=>'Bishop', :color=>'white')
		pieces.create(:x=>'g', :y=>'1', :type=>'Knight', :color=>'white')
		pieces.create(:x=>'h', :y=>'1', :type=>'Rook', :color=>'white')
		pieces.create(:x=>'a', :y=>'2', :type=>'Pawn', :color=>'white')
		pieces.create(:x=>'b', :y=>'2', :type=>'Pawn', :color=>'white')
		pieces.create(:x=>'c', :y=>'2', :type=>'Pawn', :color=>'white')
		pieces.create(:x=>'d', :y=>'2', :type=>'Pawn', :color=>'white')
		pieces.create(:x=>'e', :y=>'2', :type=>'Pawn', :color=>'white')
		pieces.create(:x=>'f', :y=>'2', :type=>'Pawn', :color=>'white')
		pieces.create(:x=>'g', :y=>'2', :type=>'Pawn', :color=>'white')
		pieces.create(:x=>'h', :y=>'2', :type=>'Pawn', :color=>'white')


		pieces.create(:x=>'a', :y=>'8',:type=>'Rook', :color=>'black')
		pieces.create(:x=>'b', :y=>'8', :type=>'Knight', :color=>'black')
		pieces.create(:x=>'c', :y=>'8', :type=>'Bishop', :color=>'black')
		pieces.create(:x=>'d', :y=>'8', :type=>'Queen', :color=>'black')
		pieces.create(:x=>'e', :y=>'8', :type=>'King', :color=>'black')
		pieces.create(:x=>'f', :y=>'8', :type=>'Bishop', :color=>'black')
		pieces.create(:x=>'g', :y=>'8', :type=>'Knight', :color=>'black')
		pieces.create(:x=>'h', :y=>'8', :type=>'Rook', :color=>'black')
		pieces.create(:x=>'a', :y=>'7', :type=>'Pawn', :color=>'black')
		pieces.create(:x=>'b', :y=>'7', :type=>'Pawn', :color=>'black')
		pieces.create(:x=>'c', :y=>'7', :type=>'Pawn', :color=>'black')
		pieces.create(:x=>'d', :y=>'7', :type=>'Pawn', :color=>'black')
		pieces.create(:x=>'e', :y=>'7', :type=>'Pawn', :color=>'black')
		pieces.create(:x=>'f', :y=>'7', :type=>'Pawn', :color=>'black')
		pieces.create(:x=>'g', :y=>'7', :type=>'Pawn', :color=>'black')
		pieces.create(:x=>'h', :y=>'7', :type=>'Pawn', :color=>'black')


		
	end


end
