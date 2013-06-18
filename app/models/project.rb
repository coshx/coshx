class Project < ActiveRecord::Base
  attr_accessible :description, :title, :picture, :url, :featured
  mount_uploader :picture, PictureUploader
  has_many :quotes
end
