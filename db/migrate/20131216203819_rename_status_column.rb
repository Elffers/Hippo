class RenameStatusColumn < ActiveRecord::Migration
  def change
    rename_column :orders, :state, :status
  end
end
