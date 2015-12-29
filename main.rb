require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader' if development?

configure(:development) do 
  set :database, 'sqlite3:dddb.sqlite3'
end

require './models'

set :sessions, :true

get '/' do
#  "Welcome to DishDish!"
	session.clear
	erb :login
end

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
		erb :login
	elsif owner_exists?(params[:username])
		@user = Owner.where(username: params[:username]).first
		if valid_password?(@user, params[:password])
			session[:owner] = true	
			session[:user_id] = Owner.where(username: params[:username]).first.id
			erb :owner_home
		else
			puts "That password is not correct." #TODO: add flash message
			erb :login
		end
	elsif user_exists?(params[:username])
		@user = User.where(username: params[:username]).first
		if valid_password?(@user, params[:password])
			session[:user_id] = User.where(username: params[:username]).first.id
			session[:owner] = false
			erb :user_home
		else
			puts "That password is not correct." #TODO: flash message
			erb :login
		end
	end
end

# route for adding a Menu
post '/add-menu' do
	# TODO: input validation
	Menu.create(name: params[:name],
				address: params[:address],
				phone: params[:phone],
				description: params[:description],
				owner_id: session[:user_id])
	erb :owner_home		
end

# route for adding new Dish (menu item)
post '/add-dish' do

end

# route for adding review of menu item 
post '/add-review' do
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