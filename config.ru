require 'rubygems'
require 'sinatra'
require './app'

map "/" do
  run TodoList
end
