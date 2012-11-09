require 'faker'

FactoryGirl.define do

  factory :message do
    name                = Faker::Name.name
    email               = Faker::Internet.email
    company_name        = Faker::Company.name
    country             = Faker::Address.country
    phone               = Faker::PhoneNumber.phone_number
    project_description = Faker::Lorem.paragraph
    deadline            = Date.today + 6.months
    budget              = "$$$$$"
    comment             = Faker::Lorem.paragraph
  end

end