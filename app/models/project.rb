class Project < ActiveRecord::Base

  attr_accessible :description, :title, :picture
  mount_uploader :picture, PictureUploader
  has_many :quotes

end
