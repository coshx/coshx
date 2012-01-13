FactoryGirl.define do

  factory :post do
    sequence(:title) { |i| "Title #{i}" }
    author
    body <<-EOF
### Markdown header
#### Markdown subheader
This is some markdown text.
This is some more markdown text.
Yet another line of markdown text.
    EOF

    factory :published_post do
      posted_on { DateTime.now.utc }
    end
  end

end
