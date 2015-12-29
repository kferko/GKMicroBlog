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
	erb :login
end

post '/create-user' do
	if !Owner.where(username: params[:username]).first.nil?
		puts "There is already an Owner with that name!" #TODO: Add flash message
		erb :login
	elsif !User.where(username: params[:username]).first.nil?
		puts "There is already a User with that name!" #TODO: Add flash message
		erb :login
	elsif params[:password] != params[:password_confirmation]
		puts "Those passwords don't match!" #TODO: Add flash message
		erb :login
	### TODO: Add validation of username (restrict to alphanumeric, length, etc.)
	### TODO: Add validation of password (restrict to alphanumeric, length, etc.)
	else 
		User.create(username: params[:username], password: params[:password])
		puts "User #{params[:username]} created!!!"
		session[:user_id] = User.where(username: params[:username]).first.id
		erb :new_user_success
	end
end

def current_user
	if session[:user_id]
		@current_user = User.find(session[:user_id])
	end
end
