class AddFirstMoveTypeBooleanToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :first_move, :boolean, default: true
  end
end
