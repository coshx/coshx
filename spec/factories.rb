Factory.sequence(:name) { |i| "testuser_#{i}" }
Factory.sequence(:email) { |i| "testuser_#{i}@coshx.com" }
Factory.sequence(:password) { |i| "password_#{i}" }
Factory.sequence(:title) { |i| "Title #{i}" }
Factory.sequence(:markdown_doc) do |i|
  <<-EOF
## Title#{i}
#{Forgery(:lorem_ipsum).paragraphs(3)}
  EOF
end

Forgery
Factory.define :admin do |a|
  a.name { Factory.next :name }
  a.email { Factory.next :email }
  a.password { Factory.next :password }
end

Factory.define :post do |p|
  p.title { Factory.next :title }
  p.text { Factory.next :lorem_ipsum }
  p.author { Factory.create :admin }
end