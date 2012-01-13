FactoryGirl.define do

  factory :admin, :aliases => [:author] do
    sequence(:name)     { |i| "testuser_#{i}" }
    sequence(:email)    { |i| "testuser_#{i}@coshx.com" }
    sequence(:password) { |i| "password_#{i}" }
  end

end
