class Player < ActiveRecord::Base
	has_many :pieces
	has_many :games
end
