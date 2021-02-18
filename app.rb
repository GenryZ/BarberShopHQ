#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'rake'

#Create database 
 
set :database, {adapter:"sqlite3", database:"barbershop.db"}
#Create entity Client

class Client < ActiveRecord::Base 
end
class Barber < ActiveRecord::Base
end

before do
	@barbers = Barber.all
end
get '/' do
	
	erb :index
end
get '/visit' do
	erb :visit
end
post '/visit' do 
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	c = Client.new
	c.name = @username
	c.phone = @phone
	c.datestamp = @datetime
	c.barber = @barber
	c.color = @color 
	c.save #save the variables
	
	erb "<h2> Thank you!</h2>"
end