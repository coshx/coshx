class Client < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :company_logo
  validates_presence_of :site_url

end
