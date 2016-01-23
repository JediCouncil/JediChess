class RemoveFirstMoveEnumColumnFromPieces < ActiveRecord::Migration
  def change
    remove_column :pieces, :first_move, :integer
  end
end
