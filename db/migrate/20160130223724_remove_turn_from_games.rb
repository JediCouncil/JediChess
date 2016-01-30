class RemoveTurnFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :turn, :integer
  end
end
