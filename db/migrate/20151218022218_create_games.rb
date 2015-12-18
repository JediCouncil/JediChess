class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|

    	t.string :name
    	
    	t.timestamps null: false
  	end

    add_index :games
  end
end
