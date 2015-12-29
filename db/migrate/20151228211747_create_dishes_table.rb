class CreateDishesTable < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :menu_id
    end
  end
end
