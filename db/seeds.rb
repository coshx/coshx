
# -*- coding: utf-8 -*-
require 'contenteditable'

#ADMINS

demo = Admin.find_or_create_by_email("demo@example.org") do  |user|
  user.name = 'Demo'
  user.last_name = 'User'
  user.password = 'password'
  user.twitter = ''
  user.github = ''
  user.position = 'Code Monkey'
  user.bio = ''
end
demo.save!
puts "Created Demo User"


#BLOG POSTS
puts "Creating POSTS..."

post = Post.find_or_create_by_title('First Post') do |post|
  post.title = 'First Post'
  post.author_id = Admin.find_by_email('demo@example.org').id
  post.created_at = '2012-03-25 04:14:32 UTC'
  post.posted_on = ''
  post.updated_at = '2012-03-25 04:14:32 UTC'
  post.body = <<EOF
  New now know how.

  Here is some code:

```ruby
  class DemoClass
    def demo_method
      [:world,:darkness,:nurse].each{ |n| puts "Hello, #{n}"}
    end
  end
```
EOF
end

posts.each do |p|
  puts "Publishing post '#{p.title}'"
  post_date = p.posted_on
  p.publish
  p.posted_on = post_date
  p.save!
end

