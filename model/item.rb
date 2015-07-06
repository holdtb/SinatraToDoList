require 'mongo_mapper'

class Item
  include MongoMapper::Document

  key :id,      Serial
  key :content, String, :required => true
  key :done,    Boolean, :required => true, :default => false
  key :created, DateTime
end
