class Job < ActiveRecord::Base
  include Publishable
  extend MarkdownAttributes

  attr_markdown :description

  validates_presence_of :title, :description
  validates_uniqueness_of :title, :case_sensitive => false

  def to_param
    title.downcase.gsub ' ', '_'
  end
end
