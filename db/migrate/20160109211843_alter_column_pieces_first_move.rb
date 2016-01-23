class AlterColumnPiecesFirstMove < ActiveRecord::Migration
  def change
    change_column :pieces, :first_move, :integer, default: 0
  end
end
