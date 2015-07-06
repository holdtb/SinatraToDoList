require 'rubygems'
require 'sinatra'
require './app'
require 'bundler'

Bundler.require

map "/" do
  run TodoList
end
