class CreateMenusTable < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :description
      t.integer :owner_id
    end
  end
end
