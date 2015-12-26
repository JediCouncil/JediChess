class Piece < ActiveRecord::Base
	belongs_to :user
	belongs_to :game


	enum status: [ :black, :white]

	def self.types #find out if we absolutely need this!!!
      %w(Knight Bishop King Queen Rook Pawn)
    end


  	def is_obstructed(destination_x, destination_y)

  	end

end
