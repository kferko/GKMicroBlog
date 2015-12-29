class RemoveMenuidColFromOwners < ActiveRecord::Migration
  def change
    remove_column :owners, :menu_id
  end
end
