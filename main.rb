require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader' if development?

configure(:development) do 
  set :database, 'sqlite3:dddb.sqlite3'
end

require './models'

set :sessions, :true

get '/' do
	erb :home_ruby
end

get '/user_home_css' do
	erb :user_home_css
end

get '/user_home_css_ruby' do
	erb :user_home_css_ruby
end

get '/owner_home_css' do
	erb :owner_home_css
end

get '/restaurant_home' do
	erb :restaurant_home
end

get '/modaltest' do
	erb :modaltest
end

get '/modal_reviewentry' do
	erb :modal_reviewentry
end

get '/modal_usernew' do
	erb :modal_usernew
end

get '/public_profile' do
	erb :public_profile
end

# get '/' do
# #  "Welcome to DishDish!"
# 	session.clear
# 	erb :login
# end

post '/create-user' do
	if name_taken?(params[:username]) 
		puts "That name has already been taken!" #TODO: Add flash message
		erb :login
	elsif params[:password] != params[:password_confirmation]
		puts "Those passwords don't match!" #TODO: Add flash message
		erb :login
	### TODO: Add validation of username (restrict to alphanumeric, length, etc.)
	### TODO: Add validation of password (restrict to alphanumeric, length, etc.)
	else 
		User.create(username: params[:username], password: params[:password])
		session[:user_id] = User.where(username: params[:username]).first.id
		erb :user_home
	end
end

post '/create-owner' do
	if name_taken?(params[:username]) 
		puts "That name has already been taken!" #TODO: Add flash message
		erb :login
	elsif params[:password] != params[:password_confirmation]
		puts "Those passwords don't match!" #TODO: Add flash message
		erb :login
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

post '/sign-in' do
	if !name_taken?(params[:username])
		puts "That username doesn't exist!" #TODO: add flash message
		erb :home_ruby
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

# to current user profile
get '/profile' do
	if session[:owner]
		erb :owner_home
	else 
		erb :user_home
	end
end

# to current user profile settings
get '/update/user/:user_id' do
	erb :update_user
end

# deleting a dish from a menu
post '/delete/:dish_id' do
	current_menu.dishes.find(params[:dish_id]).destroy if session[:owner]
	redirect '/profile'
end

# route for updating a User profile detail 
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
	erb :update_user
end

get '/menu/:menu_id' do
	erb :menu
end

# route for adding a Menu
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
post '/add-dish' do
	Dish.create(name: params[:name],
				price: params[:price],
				description: params[:description],
				menu_id: current_menu.id)
	redirect '/profile' #TODO: add flash message for dish addition success
end

# route to dish update view
get '/update/dish/:dish_id' do
	erb :update_item
end

# route for updating a Dish (menu item)
post '/update/dish/:dish_id' do
	Dish.find(params[:dish_id]).update_attributes(params.keys.first => params[params.keys.first])
	erb :update_item
end

# route for creating/updating review of menu item 
get '/item/:dish_id/review' do
	erb :item_review
end

post '/item/:dish_id/review' do
	if Review.where(dish_id: params[:dish_id], user_id: current_user.id).empty? 
		Review.create(dish_id: params[:dish_id], user_id: current_user.id, rating: params[:rating], description: params[:description])
    else
    	Review.where(dish_id: params[:dish_id], user_id: current_user.id).first.update_attributes(rating: params[:rating], description: params[:description])		
    end
	erb :item_review
end

post '/item/:dish_id/review/delete' do
	Review.where(dish_id: params[:dish_id], user_id: current_user.id).first.destroy
	erb :item_review
end

# route to list of all reviews of an item
get '/item/:dish_id/reviews' do
	erb :reviews
end

# route to user public profile
get '/user/:other_id' do
	erb :public_profile
end

get '/user/:other_id/follow' do
	unless current_user.follows?(current_other.id)
		UserFriendship.create(user_id: current_user.id, user_friend_id: params[:other_id])
	end
	redirect to "/user/#{params[:other_id]}"
end

get '/user/:other_id/unfollow' do
	unless !current_user.follows?(current_other.id)	
		UserFriendship.where(user_id: current_user.id, user_friend_id: params[:other_id]).first.destroy
	end
	redirect to "/user/#{params[:other_id]}"
end

def current_user
	if session[:user_id] && session[:owner]
		@current_user = Owner.find(session[:user_id])
	elsif session[:user_id]
		@current_user = User.find(session[:user_id])
	end
end

def user_exists?(name)
	!User.where(username: name).first.nil?
end

def owner_exists?(name)
	!Owner.where(username: name).first.nil?
end

def name_taken?(name)
	user_exists?(name) || owner_exists?(name)
end

def valid_password?(user, password)
	user.password == password
end

def current_menu
	if session[:user_id] && session[:owner]
		@current_menu = Owner.find(session[:user_id]).menu
	else
		@current_menu = Menu.find(params[:menu_id])	
	end
end

def current_dish 
	@current_dish = Dish.find(params[:dish_id])
end

def current_other
	@current_other = User.find(params[:other_id])
end
