class AddStatusToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :status, :integer
  end
end
