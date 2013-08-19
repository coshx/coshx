class Project < ActiveRecord::Base
  attr_accessible :title, :tagline, :product_description, :project_description, :result_description, :picture, :url, :featured_picture, :background_color
  mount_uploader :picture, PictureUploader
	mount_uploader :featured_picture, PictureUploader

  has_many :quotes


  def permalink_attributes
    {
      :title => title.downcase.gsub(/[^\w\s]/, '').gsub(/\s+/, '-')
    }
  end

  def self.build_permalink(params)
    "#{params[:title]}"
  end

  private

  def set_permalink
    self.permalink = self.class.build_permalink permalink_attributes
  end
end
