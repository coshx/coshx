class Admin < ActiveRecord::Base
  acts_as_paranoid

  devise :database_authenticatable, :recoverable,
    :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :img

  has_many :posts, :foreign_key => "author_id"
  before_save :generate_slug

  def portrait_url
    "images/team/#{name.split(" ").first.downcase}-portrait.png"
  end

  def generate_slug
    self.slug = "#{self.name}"
    self.slug.gsub! /['`]/,""
    self.slug.gsub! /\s*@\s*/, " at "
    self.slug.gsub! /\s*&\s*/, " and "
    self.slug.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '_'
    self.slug.gsub! /_+/,"_"
    self.slug.gsub! /\A[_\.]+|[_\.]+\z/,""
    self.slug.downcase!
  end

  def url
    "/profile/" + self.slug.to_s
  end
end
