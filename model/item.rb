require 'mongo_mapper'

class Item
  include MongoMapper::Document

  key :_id
  key :content, String, :required => true
  key :done,    Boolean, :required => true, :default => false
  key :created, DateTime
end
