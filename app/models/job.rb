class Job < ActiveRecord::Base
  include Publishable
  extend MarkdownAttributes

  attr_markdown :description

  validates_uniqueness_of :title, :case_sensitive => false

  def to_param
    self.title.downcase.gsub(' ', '_')
  end
end
