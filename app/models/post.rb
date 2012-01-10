class Post < ActiveRecord::Base
  extend MarkdownAttributes
  include Publishable

  belongs_to :author, :class_name => "Admin"
  default_scope :order => "created_at DESC"

  attr_markdown :preview, :body

  before_save :set_permalink

  def preview
    lines = self.body.split(/(\n)+/)
    preview_text = lines.reject do |line|
      line =~ /^$\n/
    end.take(4).join(' ')
    "#{preview_text.chomp}..."
  end

  def permalink_attributes
    {
      :year  => posted_on.year,
      :month => "%02d" % posted_on.month,
      :day   => "%02d" % posted_on.day,
      :title => title.downcase.gsub(/\s+/, '-')
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
    if published? && permalink.blank?
      self.permalink = self.class.build_permalink permalink_attributes
    end
  end
end
