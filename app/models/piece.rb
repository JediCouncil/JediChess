class Piece < ActiveRecord::Base
	belongs_to :player
	belongs_to :game

	enum status: [ :black, :white]
end
