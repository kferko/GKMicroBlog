class User < ActiveRecord::Base
# users rate and write about individual dishes
	has_many :reviews
# users can follow other users
	has_many :user_friends, through: :user_friendships
	has_many :user_friendships

	def followers # users are followed by followers
		followerships = UserFriendship.where(user_friend_id: self.id)
		followerships.map{|followership| User.find(followership.user_id)}
	end

	def friends # users follow friends 
		self.user_friends
	end

	def followed_by?(user_id)
		followers.any?{|follower| follower.id == user_id}
	end

	def follows?(user_id)
		friends.any?{|friend| friend.id == user_id}
	end

	def recent_friend_reviews(quantity=nil)
		friend_reviews = self.friends.map { |friend| friend.reviews }
		friend_reviews.flatten!
		if quantity
			friend_reviews.sort_by{ |review| review.id }.reverse[0..quantity-1]
		else
			friend_reviews.sort_by{ |review| review.id }.reverse
		end
	end

	def recent_reviews(quantity=nil)
		if quantity
			self.reviews.sort_by{ |review| review.id }.reverse[0..quantity-1]
		else
			self.reviews.sort_by{ |review| review.id }.reverse
		end
	end

	def most_recent_review
		self.reviews.sort_by{ |review| review.id }.reverse.first
	end

	def public_name
		self.firstname.capitalize + " " + self.lastname[0].upcase + "."
	end

	def public_location
		self.city.capitalize + ", " + self.state.upcase
	end

	def highest_review 
		self.reviews.sort_by{ |review| review.rating }.reverse.first
	end

	def lowest_review 
		self.reviews.sort_by{ |review| review.rating }.first
	end

	def average_rating
		all_ratings = self.reviews.map{|review| review.rating}
		average_rating = all_ratings.reduce(0){|sum, rating| sum + rating} / all_ratings.count.to_f
		'%.1f' % average_rating 
	end
end

class Review < ActiveRecord::Base
# each user review is for one specific dish
	belongs_to :user
	belongs_to :dish
	belongs_to :menu

	def self.most_recent(quantity=4)
		self.all.sort_by{ |review| review.id }.reverse[0..quantity-1]
	end
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
	has_many :reviews

	def highest_review 
		self.reviews.sort_by{|review| review.rating }.reverse.first
	end

	def average_rating
		all_ratings = self.reviews.map{|review| review.rating}
		average_rating = all_ratings.reduce(0){|sum, rating| sum + rating} / all_ratings.count.to_f
		'%.0f' % average_rating # rounds to nearest integer for now
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
			average_rating = ratings.reduce(0){|sum, rating| sum + rating} / ratings.count.to_f
			'%.0f' % average_rating # rounds to nearest integer for now
		else
			"NA"
		end
	end

	def ever_reviewed_by?(user_id)
		self.reviews.any?{|review| review.user_id == user_id}
	end
end

class UserFriendship < ActiveRecord::Base
# userfriendships are one-way relationships from one user to another
	belongs_to :user
	belongs_to :user_friend, class_name: "User"
end
