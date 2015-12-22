class Piece < ActiveRecord::Base
	belongs_to :user
	belongs_to :game

	enum status: [ :black, :white]

	def self.types
      %w(Knight Bishop King Queen Rook Pawn)
    end
end
