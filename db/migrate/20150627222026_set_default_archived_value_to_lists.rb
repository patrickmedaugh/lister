class SetDefaultArchivedValueToLists < ActiveRecord::Migration
  def change
    change_column :lists, :archived?, :boolean, :default => false
  end
end
