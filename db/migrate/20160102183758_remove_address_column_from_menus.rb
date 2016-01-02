class RemoveAddressColumnFromMenus < ActiveRecord::Migration
  def change
    remove_column :menus, :address
  end
end
