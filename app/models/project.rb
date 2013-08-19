class Project < ActiveRecord::Base
  attr_accessible :title, :product_description, :project_description, :result_description, :picture, :url, :featured_picture, :background_color
  mount_uploader :picture, PictureUploader
	mount_uploader :featured_picture, PictureUploader

  has_many :quotes
end
