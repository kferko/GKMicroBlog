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

	# check whether a user is followed by another id
	def followed_by?(user_id)
		followers.any?{|follower| follower.id == user_id}
	end

	# check whether a user is following another id
	def follows?(user_id)
		friends.any?{|friend| friend.id == user_id}
	end

	# return array of all (or a quantity of) reviews by a users friends
	def recent_friend_reviews(quantity=nil)
		friend_reviews = self.friends.map { |friend| friend.reviews }
		friend_reviews.flatten!
		if quantity
			friend_reviews.sort_by{ |review| review.id }.reverse[0..quantity-1]
		else
			friend_reviews.sort_by{ |review| review.id }.reverse
		end
	end

	# return array of all (or a quantity of) recent reviews by a user
	def recent_reviews(quantity=nil)
		if quantity
			self.reviews.sort_by{ |review| review.id }.reverse[0..quantity-1]
		else
			self.reviews.sort_by{ |review| review.id }.reverse
		end
	end

	# return most recently written review 
	def most_recent_review
		self.reviews.sort_by{ |review| review.id }.reverse.first
	end

	# return a concatenation of user's first and last name
	def public_name
		self.firstname.capitalize + " " + self.lastname[0].upcase + "."
	end

	# return a concatenation of a user's city and state
	def public_location
		self.city.capitalize + ", " + self.state.upcase
	end

	# return a review with a score equal to the highest score given
	# by this user (will ignore other tying reviews)
	def highest_review 
		self.reviews.sort_by{ |review| review.rating }.reverse.first
	end

	# return a review with a score equal to the lowest score given
	# by this user (will ignore other tying reviews)
	def lowest_review 
		self.reviews.sort_by{ |review| review.rating }.first
	end

	# calculate average rating across all ratings given by this user
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

	# return several (4 by default) recently written reviews (by anyone)
	def self.most_recent(quantity=4)
		self.all.sort_by{ |review| review.id }.reverse[0..quantity-1]
	end
end

class Owner < ActiveRecord::Base
# each owner (aka restaurant) creates one menu
	has_one :menu

	# return whether this owner has a menu
	# not used in final version
	def has_menu?
		!self.menu.nil?
	end

end

class Menu < ActiveRecord::Base
# each menu belongs to an ower and contains several dishes
	belongs_to :owner
	has_many :dishes
	has_many :reviews

	# return highest (ignoring other ties) scoring review for this menu
	def highest_review 
		self.reviews.sort_by{|review| review.rating }.reverse.first
	end

	# return average of all ratings of dishes on this menu
	def average_rating
		all_ratings = self.reviews.map{|review| review.rating}
		average_rating = all_ratings.reduce(0){|sum, rating| sum + rating} / all_ratings.count.to_f
		'%.0f' % average_rating # rounds to nearest integer for now
	end

	# return quantity (or all) recently reviews of dishes from this menu
	def recent_reviews(quantity=nil)
		if quantity
			self.reviews.sort_by{ |review| review.id }.reverse[0..quantity-1]
		else
			self.reviews.sort_by{ |review| review.id }.reverse
		end
	end
end

class Dish < ActiveRecord::Base
# every dish belongs to one menu, and can have many reviews from users
	belongs_to :menu
	has_many :reviews

	# returns whether the dish has any reviews
	def has_reviews?
		!self.reviews.empty? 
	end

	# return array of all ratings for this dish
	def ratings
		self.reviews.map{|review| review.rating}
	end

	# return average of all ratings for this dish
	def average_rating 
		if has_reviews?
			average_rating = ratings.reduce(0){|sum, rating| sum + rating} / ratings.count.to_f
			'%.0f' % average_rating # rounds to nearest integer for now
		else
			"NA"
		end
	end

	# returns whether this dish was ever reviewed by a given user
	def ever_reviewed_by?(user_id)
		self.reviews.any?{|review| review.user_id == user_id}
	end
end

class UserFriendship < ActiveRecord::Base
# userfriendships are one-way relationships from one user to another
	belongs_to :user
	belongs_to :user_friend, class_name: "User"
end
