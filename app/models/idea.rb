class Idea < ActiveRecord::Base
  extend MarkdownAttributes

  belongs_to :author, :class_name => "Admin"

  validates_presence_of :title

  attr_markdown :description
  attr_accessible :title, :up_votes

end
