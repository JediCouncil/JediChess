class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
    	t.string :x 
    	t.integer :y
    	t.integer :color
    	t.string :outcome
    	t.string :casualty
    	t.integer :game_id
    	t.integer :player_id
    	t.integer :time_lapsed
    	t.string :type

    		
    	

      t.timestamps null: false
    end
  end
end
