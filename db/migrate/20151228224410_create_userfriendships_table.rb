class CreateUserfriendshipsTable < ActiveRecord::Migration
  def change
    create_table :user_friendships do |uf|
      uf.integer :user_id
      uf.integer :user_friend_id
    end
  end
end
