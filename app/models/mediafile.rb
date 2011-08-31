class Mediafile < ActiveRecord::Base
  attr_accessible :name, :attachment
  
  has_attached_file :attachment
end
