require 'faker'

FactoryGirl.define do

  factory :message do
    name                Forgery::Name.full_name
    email               Forgery::Internet.email_address
    company_name        Forgery::Name.company_name
    country             Forgery::Address.country
    phone               Forgery::Address.phone
    project_description Forgery('lorem_ipsum').paragraph
    deadline            Date.today + 6.months
    budget              "$$$$$"
    comment             Forgery('lorem_ipsum').paragraph
  end

end
