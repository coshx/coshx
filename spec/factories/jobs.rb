FactoryGirl.define do

  factory :job do
    sequence(:title) { |i| "Job #{i}" }
    description <<-EOF
### Job Opening
Come work for Coshx
    EOF
  end
end
