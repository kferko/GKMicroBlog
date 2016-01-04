class AddCourseToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :course, :integer
  end
end
