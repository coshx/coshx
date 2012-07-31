class FeaturedProject < ActiveRecord::Base
  attr_accessible :description, :title, :picture  
  mount_uploader :picture, PictureUploader
end
