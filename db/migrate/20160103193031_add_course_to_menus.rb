class AddCourseToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :course1, :string
    add_column :menus, :course2, :string
    add_column :menus, :course3, :string
    add_column :menus, :course4, :string
  end
end
