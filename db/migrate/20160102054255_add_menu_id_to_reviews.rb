class AddMenuIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :menu_id, :integer
  end
end
