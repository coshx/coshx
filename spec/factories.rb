Factory.sequence(:name) { |i| "testuser_#{i}" }
Factory.sequence(:email) { |i| "testuser_#{i}@coshx.com" }
Factory.sequence(:password) { |i| "password_#{i}" }
Factory.sequence(:title) { |i| "Title #{i}" }

Factory.define :admin do |a|
  a.name { Factory.next :name }
  a.email { Factory.next :email }
  a.password { Factory.next :password }
end

Factory.define :post do |p|
  p.title { Factory.next :title }
  p.author { Factory.create :admin }
  p.body do
    <<-EOF
### Markdown header
#### Markdown subheader
This is some markdown text.
This is some more markdown text.
Yet another line of markdown text.
    EOF
  end
end