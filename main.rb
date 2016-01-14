require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader' if development?

configure(:development) do 
  set :database, 'sqlite3:dddb.sqlite3'
end

require './models'

set :sessions, :true

get '/' do
	@title = "dishdish  .  a greg and kevin production"
	erb :home_ruby
end

post '/create-user' do
	# check if proposed new username is already in use
	if name_taken?(params[:username]) 
		puts "That name has already been taken!" #TODO: Add flash message
		erb :home_ruby
		# check if supplied password matches the password_confirmation field
	elsif params[:password] != params[:password_confirmation]
		puts "Those passwords don't match!" #TODO: Add flash message
		erb :home_ruby
	### TODO: Add validation of username (restrict to alphanumeric, length, etc.)
	### TODO: Add validation of password (restrict to alphanumeric, length, etc.)
	else 
		# create new User
		User.create(username: params[:username], password: params[:password])
		session[:user_id] = User.where(username: params[:username]).first.id
		erb :user_home_css_ruby
	end
end

# The "Create owner" feature was discontinued during development
post '/create-owner' do
	if name_taken?(params[:username]) 
		puts "That name has already been taken!" #TODO: Add flash message
		erb :home_ruby
	elsif params[:password] != params[:password_confirmation]
		puts "Those passwords don't match!" #TODO: Add flash message
		erb :home_ruby
	### TODO: Add validation of username (restrict to alphanumeric, length, etc.)
	### TODO: Add validation of password (restrict to alphanumeric, length, etc.)
	else 
		Owner.create(username: params[:username], password: params[:password])
		session[:user_id] = Owner.where(username: params[:username]).first.id
		session[:owner] = true
		# erb :new_owner_success
		erb :owner_home
	end
end

# route for signing-in existing users
post '/sign-in' do
	# check if username exists - if not, reroute back home
	if !name_taken?(params[:username])
		puts "That username doesn't exist!" #TODO: add flash message
		erb :home_ruby
		# check if name matches an Owner account
	elsif owner_exists?(params[:username])
		@user = Owner.where(username: params[:username]).first
		if valid_password?(@user, params[:password])
			session[:owner] = true	
			session[:user_id] = Owner.where(username: params[:username]).first.id
			erb :owner_home
		else
			puts "That password is not correct." #TODO: add flash message
			erb :home_ruby
		end
		# if username is in database, validate password and sign in
	elsif user_exists?(params[:username])
		@user = User.where(username: params[:username]).first
		if valid_password?(@user, params[:password])
			session[:user_id] = User.where(username: params[:username]).first.id
			session[:owner] = false
			erb :user_home_css_ruby
		else
			puts "That password is not correct." #TODO: flash message
			erb :home_ruby
		end
	end
end

# route for logging out
get '/sign-out' do
	session.clear
	redirect '/'
end

# route to current user profile
get '/profile' do
	if session[:owner]
		erb :owner_home
	else 
		erb :user_home_css_ruby
	end
end

# to current user profile settings
get '/update/user/:user_id' do
	erb :user_home_css_ruby
end

# Route for deleting dishes from a menu
# This was an Owner feature not included in final version
post '/delete/:dish_id' do
	current_menu.dishes.find(params[:dish_id]).destroy if session[:owner]
	redirect '/profile'
end

# route for updating User profile details
post '/update/user/:user_id' do
	User.find(params[:user_id]).update_attributes(
		firstname: params[:firstname],
		lastname: params[:lastname],
		motto: params[:motto],
		email: params[:email],
		phone: params[:phone],
		street: params[:street],
		city: params[:city],
		state: params[:state],
		zip: params[:zip])

	redirect '/user_home_css_ruby'
end

# route for updating a User password
post '/change-password/user/:user_id' do
	if valid_password?(current_user, params[:old_password]) && (params[:new_password] == params[:new_password_confirmation])
		User.find(params[:user_id]).update_attributes(password: params[:new_password])
	end #TODO: add flash message for password change success
	erb :user_home_css_ruby
end

# route for deleting/destroying a User account
post '/delete/user/:user_id' do
	if valid_password?(current_user, params[:delete_password])
		# delete reviews by user
		current_user.reviews.each do |review|
			review.destroy
			puts "Review destroyed!"
		end
		# delete UserFriendships involving user
		# where user is follower
		UserFriendship.where(user_id: current_user.id).each do |friendship|
			friendship.destroy
		end
		# where user is friend
		UserFriendship.where(user_friend_id: current_user.id).each do |friendship|
			friendship.destroy
		end
		# delete user
		User.find(current_user.id).destroy
		#TODO: add flash message for incorrect password
		session.clear
		redirect '/'
	else
		#TODO: add flash message for deletion success
		puts "That is not the correct password!"
		redirect '/user_home_css_ruby'
	end
end

# route for individual menu
get '/menu/:menu_id' do
	erb :restaurant_home_ruby
end

# route for adding a Menu
# This was an Owner feature not included in final version
post '/add-menu' do
	# TODO: input validation
	Menu.create(name: params[:name],
				address: params[:address],
				phone: params[:phone],
				description: params[:description],
				owner_id: session[:user_id])
	redirect '/profile'
end

# route for adding new Dish (menu item)
# This was an Owner feature not included in final version
post '/add-dish' do
	Dish.create(name: params[:name],
				price: params[:price],
				description: params[:description],
				menu_id: current_menu.id)
	redirect '/profile' #TODO: add flash message for dish addition success
end

# route to dish update view
# This was an Owner feature not included in final version
get '/update/dish/:dish_id' do
	erb :update_item
end

# route for updating a Dish (menu item)
# This was an Owner feature not included in final version
post '/update/dish/:dish_id' do
	Dish.find(params[:dish_id]).update_attributes(params.keys.first => params[params.keys.first])
	erb :update_item
end

# route for reviewing an individual dish
# Users can only have one review per dish. Old reviews of the same dish will be overwritten.
post '/item/:dish_id/review' do
   menu_id = Dish.find(params[:dish_id]).menu_id
	if Review.where(dish_id: params[:dish_id], user_id: current_user.id).empty? 
		Review.create(dish_id: params[:dish_id], user_id: current_user.id, rating: params[:rating], description: params[:description], menu_id: menu_id)
    else
    	Review.where(dish_id: params[:dish_id], user_id: current_user.id).first.update_attributes(rating: params[:rating], description: params[:description], menu_id: menu_id)		
    end
    redirect to "/menu/#{menu_id}"
end

# route to user public profile
get '/user/:other_id' do
	erb :public_profile
end

# route for following another user
get '/user/:other_id/follow' do
	unless current_user.follows?(current_other.id)
		UserFriendship.create(user_id: current_user.id, user_friend_id: params[:other_id])
	end
	redirect to "/user/#{params[:other_id]}"
end

# route for unfollowing another user
get '/user/:other_id/unfollow' do
	unless !current_user.follows?(current_other.id)	
		UserFriendship.where(user_id: current_user.id, user_friend_id: params[:other_id]).first.destroy
	end
	redirect to "/user/#{params[:other_id]}"
end

# #current_user sets instance variable based on session
def current_user
	if session[:user_id] && session[:owner]
		@current_user = Owner.find(session[:user_id])
	elsif session[:user_id]
		@current_user = User.find(session[:user_id])
	end
end

# convenience methods for login/signin

# check whether username is in users table
def user_exists?(name)
	!User.where(username: name).first.nil?
end

# check whether username is in owners table
def owner_exists?(name)
	!Owner.where(username: name).first.nil?
end

# check whether username is in either users or owners table
def name_taken?(name)
	user_exists?(name) || owner_exists?(name)
end

# check whether a password matches a given user's password
def valid_password?(user, password)
	user.password == password
end

# current_menu sets an instance variable @current_menu,
# which was intended mostly for use by Owners (not in this version)
def current_menu
	if session[:user_id] && session[:owner]
		@current_menu = Owner.find(session[:user_id]).menu
	else
		@current_menu = Menu.find(params[:menu_id])	
	end
end

# intended for isoloated views of a dish, not used in 
# final version
def current_dish 
	@current_dish = Dish.find(params[:dish_id])
end

# current_other is used when loading details about 
# other users and their profile pages
def current_other
	@current_other = User.find(params[:other_id])
end
