class Content < ActiveRecord::Base
  attr_accessible :action, :index, :value
  
    validates_presence_of :action
end
