class Project < ActiveRecord::Base
  attr_accessible :description, :title, :picture, :url
  mount_uploader :picture, PictureUploader
  has_many :quotes
end
