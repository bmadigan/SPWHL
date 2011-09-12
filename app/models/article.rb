class Article < ActiveRecord::Base
  attr_accessible :article_title, :article_content, :summary, :assets_attributes, :article_image
  
  has_many :assets
  accepts_nested_attributes_for :assets, :allow_destroy => true
  
  default_scope :order => "created_at DESC"
  
  define_easy_dates do
      format_for :created_at, :format => "%B %e, %Y"
      #format_for :updated_at, :format => "%H:%M%P", :as => "updated_time"
  end
  
  scope :lastest_articles, lambda { limit("5") }
end
