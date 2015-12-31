class RemoveStatusFromPieces < ActiveRecord::Migration
  def change
    remove_column :pieces, :status, :integer
  end
end
