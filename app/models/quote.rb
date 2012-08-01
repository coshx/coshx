class Quote < ActiveRecord::Base
  attr_accessible :author, :project_id, :text
  belongs_to :project 
end
