class Content < ActiveRecord::Base
  attr_accessible :action, :welcome, :value

  validates_presence_of :action
end
