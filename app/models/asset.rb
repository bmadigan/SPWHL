class Asset < ActiveRecord::Base
  belongs_to :article
  belongs_to :page
  
  has_attached_file :asset
end
