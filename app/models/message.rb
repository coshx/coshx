class Message < ActiveRecord::Base
  attr_accessible :budget, :comment, :company_name, :country, :deadline, :email, :name, :phone, :project_description, :text

  validates :email, :name, :presence => true
end
