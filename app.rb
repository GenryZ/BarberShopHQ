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
	
	c = Client.new params[:client]#создаем объект класса Клиент и передаем параметры в visit.erb
	c.save
	
	erb "<h2> Thank you!</h2>"
end