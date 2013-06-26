class Post < ActiveRecord::Base
  extend MarkdownAttributes
  include Publishable
  include Tweeter

  belongs_to :author, :class_name => "Admin"
  default_scope :order => "posted_on DESC"

  attr_markdown :preview, :body

  validates_presence_of :title, :body, :author

  before_save :set_permalink
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

  def self.build_permalink(params)
    "#{params[:year]}/#{params[:month]}/#{params[:day]}/#{params[:title]}"
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

  def send_tweet
    Tweeter.blog_post_tweet(self) if self.posted_on_changed? && self.published?
  end
end
