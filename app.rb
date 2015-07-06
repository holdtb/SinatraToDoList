require 'rubygems'
require 'json'
require 'sinatra/base'
require 'sinatra/reloader'
require 'mongo_mapper'
require './model/item'

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

  get "/new" do
    @title = "Add todo Item"
    erb :new
  end

  post "/new" do
    Item.create!(:content => params[:content], :created => Time.now)
    redirect '/'
  end

  post "/done" do
    item = Item.first(:id => params[:id])
    item.done = !item.done
    item.save
    content_type 'application/json'
    value = item.done ? 'done' : 'not done'
    {:id => params[:id], :status => value}.to_json
  end

  get "/delete/:id" do
    @item = Item.first(:id => params[:id])
    erb :delete
  end

  post "/delete/:id" do
    if params.has_key?("ok")
      item = Item.first(:id => params[:id])
      item.destroy
      redirect '/'
    else
      redirect '/'
    end
  end

end
