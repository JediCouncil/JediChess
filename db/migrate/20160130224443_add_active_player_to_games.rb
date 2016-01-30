class AddActivePlayerToGames < ActiveRecord::Migration
  def change
    add_column :games, :active_player_id, :integer
  end
end
