class CreateReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :description
      t.integer :user_id
      t.integer :dish_id
    end
  end
end
