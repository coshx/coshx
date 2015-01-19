class Image < ActiveRecord::Base
  belongs_to :admin
  has_attached_file :paperclip,
                    #:styles => { :medium => "x300", :thumb => "x100" }, update rmagick / ImageMagick
                    :default_url => "default",
                    :storage => :s3,
                    :bucket => 'coshx-blog-images',
                    :s3_credentials => {
                        :bucket => ENV["S3_BUCKET_NAME"],
                        :access_key_id => ENV["S3_KEY"],
                        :secret_access_key => ENV["S3_SECRET"]},
                    :url => "/:image/:id/:style/:basename.:extension",
                    :path => ":image/:id/:style/:basename.:extension"

  attr_accessible :paperclip
  validates_attachment_content_type :paperclip, :content_type => /\Aimage\/.*\Z/

  def self.for_other_users_than(current_admin)
    Image.where('admin_id != ?', current_admin.id)
  end
end
