class User < ActiveRecord::Base
# users rate and write about individual dishes
	has_many :reviews
# users can follow other users
	has_many :user_friends, through: :user_friendships
	has_many :user_friendships
end

class Review < ActiveRecord::Base
# each user review is for one specific dish
	belongs_to :user
	belongs_to :dish
end

class Owner < ActiveRecord::Base
# each owner (aka restaurant) creates one menu
	has_one :menu

	def has_menu?
		!self.menu.nil?
	end

end

class Menu < ActiveRecord::Base
# each menu belongs to an ower and contains several dishes
	belongs_to :owner
	has_many :dishes

	def menu_status

	end
end

class Dish < ActiveRecord::Base
# every dish belongs to one menu, and can have many reviews from users
	belongs_to :menu
	has_many :reviews

	def has_reviews?
		!self.reviews.empty? 
	end

	def ratings
		self.reviews.map{|review| review.rating}
	end

	def average_rating 
		if has_reviews?
			ratings.reduce(0){|sum, rating| sum + rating} / ratings.count.to_f
		else
			"NA"
		end
	end
end

class UserFriendship < ActiveRecord::Base
# userfriendships are one-way relationships from one user to another
	belongs_to :user
	belongs_to :user_friend, class_name: "User"
end
