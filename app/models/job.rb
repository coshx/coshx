class Job < ActiveRecord::Base
  include Publishable
  extend MarkdownAttributes

  attr_markdown :description
end
