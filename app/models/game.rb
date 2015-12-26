class Game < ActiveRecord::Base
	has_many :users

	scope :available, -> {
		joins(:users).
		group('games.id').
		having('count(id) = 1')
	}
end


