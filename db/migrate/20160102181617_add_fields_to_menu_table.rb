class AddFieldsToMenuTable < ActiveRecord::Migration
  def change
    add_column :menus, :cuisine, :string
    add_column :menus, :street, :string
    add_column :menus, :city, :string
    add_column :menus, :state, :string
    add_column :menus, :zip, :string
    add_column :menus, :website, :string
    add_column :menus, :hours_1_sun, :string
    add_column :menus, :hours_2_mon, :string
    add_column :menus, :hours_3_tue, :string
    add_column :menus, :hours_4_wed, :string
    add_column :menus, :hours_5_thu, :string
    add_column :menus, :hours_6_fri, :string
    add_column :menus, :hours_7_sat, :string
    add_column :menus, :alcohol, :boolean
    add_column :menus, :parking, :boolean
    add_column :menus, :price, :integer
  end
end
