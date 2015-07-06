require 'rubygems'
require 'sinatra/base'
require 'sinatra/reloader'
require 'mongo_mapper'

class TodoList < Sinatra::Base

  configure :development do
   MongoMapper.connection = Mongo::Connection.new("localhost")
   MongoMapper.database = "TodoList"
 end

  get "/" do
    @items = Item.all(:order => :created.desc)
    redirect '/new' if @items.empty?
    erb :index
  end

end
