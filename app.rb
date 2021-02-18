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
