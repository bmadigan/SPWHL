class Asset < ActiveRecord::Base
  belongs_to :article
  belongs_to :page
  
  has_attached_file :asset,
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml"
  
end
