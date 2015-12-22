class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|

    	t.integer :score
    	t.string :result
    	t.integer :black_player_id
    	t.integer :white_player_id

    	t.timestamps null: false
  	end
  end
end
