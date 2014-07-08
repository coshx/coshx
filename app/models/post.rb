class Post < ActiveRecord::Base
  extend MarkdownAttributes
  include Publishable
  include Tweeter

  belongs_to :author, :class_name => "Admin"
  default_scope :order => "posted_on DESC"

  scope :by_author_slug, ->(author_slug) { 
    if author_slug.present?
      joins(:author).where(admins: { slug: author_slug })
    end
  }

  attr_markdown :preview, :body

  validates_presence_of :title, :body, :author, :seo_title
  validates_uniqueness_of :seo_title

  before_save :set_permalink, :set_seo_permalink
  before_validation :set_seo_title
  after_update :send_tweet

  def author 
    Admin.unscoped.where(id: author_id).first
  end

  def preview
    lines = self.body.split(/(\n)+/)
    preview_text = lines.reject do |line|
      line =~ /^$\n/
    end.take(2).join(' ')
    "#{preview_text.chomp}..."
  end

  def permalink_attributes
    {
      :year  => posted_on.year,
      :month => "%02d" % posted_on.month,
      :day   => "%02d" % posted_on.day,
      :title => title.downcase.gsub(/[^\w\s]/, '').gsub(/\s+/, '-')
    }
  end

  def seo_permalink_attributes
    {
      # :seo_title => seo_title.downcase.gsub(/[^\w\s]/, '').gsub(/\s+/, '-')
      # :seo_title => seo_title.gsub(/[^\w\s]/, '').gsub(/\s+/, '-')
      :seo_title => seo_title
    }
  end

  def self.build_permalink(params)
    "#{params[:year]}/#{params[:month]}/#{params[:day]}/#{params[:title]}"
  end

  def self.build_seo_permalink(params)
    "#{params[:seo_title]}"
  end

  def self.build_like_permalink(params)
    build_permalink(
      :year  => (params[:year]  || '%'),
      :month => (params[:month] || '%'),
      :day   => (params[:day]   || '%'),
      :title => '%'
    )
  end

  private

  def set_permalink
    if published?
      self.permalink = self.class.build_permalink permalink_attributes
    end
  end

  def set_seo_permalink
    if published?
      # self.permalink = self.class.build_seo_permalink seo_permalink_attributes
      # self.permalink = self.class.build_seo_permalink self.seo_title
      self.permalink = self.seo_title
    end
  end

  def set_seo_title
    if self.seo_title.blank?
      self.seo_title = self.title
    end

    # self.seo_title = self.seo_title.downcase.gsub(/[^\w\s]/, '').gsub(/\s+/, '-')
    # self.seo_title.downcase.gsub(/[^\w\s]/, '').gsub(/\s+/, '-')
    if !self.seo_title.blank?
      # self.seo_title = self.seo_title.downcase.parameterize
      self.seo_title = self.seo_title.downcase.gsub(/[^\w\s]/, '').gsub(/\s+/, '-')
    end
    # self.seo_title = self.seo_title.downcase
    # self.seo_title.downcase
  end

  def send_tweet
    Tweeter.blog_post_tweet(self) if self.posted_on_changed? && self.published?
  end
end
