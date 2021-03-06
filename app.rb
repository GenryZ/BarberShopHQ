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
	validates :name, presence: true #presence: true это хэш
	validates :phone, presence: true 
	validates :datestamp, presence: true
	validates :color, presence: true
end
class Barber < ActiveRecord::Base
end
class Person < ActiveRecord::Base
end
before do
	@barbers = Barber.all
end
get '/' do
	
	erb :index
end
get '/visit' do
	@c = Client.new
	erb :visit
end
post '/visit' do 
	
	@c = Client.new params[:client]#создаем объект класса Клиент и передаем параметры в visit.erb
	if @c.save
		erb "<h2> Thank you!</h2>"
	else	
		@error = @c.errors.full_messages.first #у с есть свойство error
												#у errors есть messages
												#это массив
												#у него есть first элемент
												#кего мы будем выводить
		erb :visit
	end

end

get '/barber/:id' do 
	@barber = Barber.find(params[:id])
	erb :barber
end

get '/bookings' do
	@clients = Client.all.order('created_at DESC')
	erb :bookings
end

get '/client/:id' do
	@client = Client.find(params[:id]) 
	erb :client
end
get '/contacts' do
  erb :contacts
end
post '/contacts' do 
	@login = params[:login]
	@pass = params[:password]
	
	if @login == "admin" && @pass == "secret"
	erb :message
	else 
	@error = '<p><h1>Access denied</h1></p>'
	erb :contacts
	end
end