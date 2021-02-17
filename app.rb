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

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end