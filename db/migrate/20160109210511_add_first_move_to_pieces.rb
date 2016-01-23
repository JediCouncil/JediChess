class AddFirstMoveToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :first_move, :integer
  end
end
