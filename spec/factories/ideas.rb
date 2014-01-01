# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :idea do
    author_id 1
    title "MyString"
    description "MyText"
    up_votes 1
  end
end
