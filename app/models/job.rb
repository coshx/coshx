class Job < ActiveRecord::Base
  include Publishable
  extend MarkdownAttributes

  attr_markdown :description

  attr_accessible :title, :description, :filled

  validates_presence_of :title, :description
  validates_uniqueness_of :title, :case_sensitive => false

  scope :filled, -> {where(:filled => true)}
  scope :open, -> {where(:filled => false)}

  def to_param
    title.downcase.gsub ' ', '_'
  end
end
