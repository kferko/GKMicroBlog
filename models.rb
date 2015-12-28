class User < ActiveRecord::Base
	has_many :reviews
	has_many :user_friends, through: :user_friendships
	has_many :user_friendships
end

class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :dish
end

class Owner < ActiveRecord::Base
	has_one :menu
end

class Menu < ActiveRecord::Base
	belongs_to :owner
	has_many :dishes
end

class Dish < ActiveRecord::Base
	belongs_to :menu
	has_many :reviews
end

class UserFriendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :user_friend, class_name: "User"
end
