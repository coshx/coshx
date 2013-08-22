class Project < ActiveRecord::Base
  has_permalink
  
  attr_accessible :title, :tagline, :product_description, :project_description, :result_description, :picture, :url, :featured_picture, :index_picture, :background_color
  

  # uncomment these once S3 is working!
  # mount_uploader :picture, PictureUploader
	# mount_uploader :featured_picture, PictureUploader
  # mount_uploader :index_picture, PictureUploader

  validates_uniqueness_of :title

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
