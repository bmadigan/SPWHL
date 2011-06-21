class Season < ActiveRecord::Base
  has_many :leagues
  
  attr_accessible :name
end
