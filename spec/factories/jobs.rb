FactoryGirl.define do

  factory :job do
    sequence(:title) { |i| "Job #{i}" }
    sequence(:filled) { false }
    description <<-EOF
### Job Opening
Come work for Coshx
    EOF
  end
end
