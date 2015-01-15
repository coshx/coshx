# -*- coding: utf-8 -*-

#ADMINS

=begin
demo = Admin.where(:email=>"user@example.org").first_or_create do  |user|
  user.name = 'Demo'
  user.last_name = 'User'
  user.password = 'password'
  user.password_confirmation = 'password'
  user.twitter = ''
  user.github = ''
  user.position = 'Code Monkey'
  user.bio = 'Demoing being an Admin all my life'
end
demo.save!
puts "Created Demo User"

alumni = Admin.where(:email=>"user@example.org").first_or_create do  |user|
  user.name = 'User'
  user.last_name = 'Demo'
  user.password = 'password'
  user.password_confirmation = 'password'
  user.twitter = ''
  user.github = ''
  user.position = 'Code Robot'
  user.bio = 'Demoing being an Alumni all my life'
  user.alumni = true
end
alumni.save!
puts "Created Demo Alumni"

#BLOG POSTS
puts "Creating POSTS..."

post = Post.where(:title => 'First Post').first_or_create do |post|
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
      [:world,:darkness,:nurse].each{ |n| puts "Hello, #\{n\}"}
    end
  end
```
EOF
end

puts "Publishing Demo Post"
post.publish
post.save!
# encoding: utf-8
# encoding: utf-8

=end

Project.delete_all

puts "Adding Out of box projects"
project = Project.where(:id => 1).first_or_create do |project|
  project.title = "AGOGO"
  project.icon = "agogo.png"
  project.picture = "agogo.png"
  project.permalink = "agogo"
  project.url = ""
  project.link_disabled = true
  project.background_color = "#4085D4"
  project.tagline = ""
  project.project_description = ""
  project.product_description = ""
  project.result_description = ""
end
project.save!(:validate => false)

project = Project.where(:id => 2).first_or_create do |project|
  project.title = "Tendril"
  project.icon = "tendril.png"
  project.picture = "tendril.png"
  project.permalink = "tendrils"
  project.url = ""
  project.link_disabled = true
  project.tagline = ""
  project.background_color = "#4085D4"
  project.project_description = ""
  project.product_description = ""
  project.result_description = ""
end
project.save!(:validate => false)

project = Project.where(:id => 3).first_or_create do |project|
  project.title = "Kidfully"
  project.icon = "kidfully.png"
  project.picture = "kidfully.png"
  project.permalink = "kidfully"
  project.url = ""
  project.link_disabled = true
  project.tagline = ""
  project.background_color = "#4085D4"
  project.project_description = ""
  project.product_description = ""
  project.result_description = ""
end
project.save!(:validate => false)

project = Project.where(:id => 4).first_or_create do |project|
  project.title = "Text Us"
  project.icon = "textus.png"
  project.picture = "textus.png"
  project.permalink = "textus"
  project.url = ""
  project.link_disabled = true
  project.tagline = ""
  project.background_color = "#4085D4"
  project.project_description = ""
  project.product_description = ""
  project.result_description = ""
end
project.save!(:validate => false)

project = Project.where(:id => 5).first_or_create do |project|
  project.title = "Nuduro"
  project.icon = "nuduro.png"
  project.picture = "nuduro.png"
  project.permalink = "nuduro"
  project.url = ""
  project.link_disabled = true
  project.tagline = ""
  project.background_color = "#4085D4"
  project.project_description = ""
  project.product_description = ""
  project.result_description = ""
end
project.save!(:validate => false)

project = Project.where(:id => 6).first_or_create do |project|
  project.title = "World Reader"
  project.icon = "worldreader.png"
  project.picture = "worldreader.png"
  project.permalink = "worldreader"
  project.url = ""
  project.link_disabled = true
  project.tagline = ""
  project.background_color = "#4085D4"
  project.project_description = ""
  project.product_description = ""
  project.result_description = ""
end
project.save!(:validate => false)

project = Project.where(:id => 7).first_or_create do |project|
  project.title = "Couchsurfing"
  project.icon = "couchsurfing.png"
  project.picture = "couchsurfing.png"
  project.permalink = "couchsurfing"
  project.url = ""
  project.link_disabled = true
  project.tagline = ""
  project.background_color = "#4085D4"
  project.project_description = ""
  project.product_description = ""
  project.result_description = ""
end
project.save!(:validate => false)

project = Project.where(:id => 8).first_or_create do |project|
  project.title = "Amuze"
  project.icon = "amuze.png"
  project.picture = "amuze.png"
  project.permalink = "amuze"
  project.url = ""
  project.link_disabled = true
  project.tagline = ""
  project.background_color = "#4085D4"
  project.project_description = ""
  project.product_description = ""
  project.result_description = ""
end
project.save!(:validate => false)

project = Project.where(:id => 9).first_or_create do |project|
  project.title = "MINR"
  project.icon = "minr.png"
  project.picture = "minr.png"
  project.permalink = "minr"
  project.url = ""
  project.link_disabled = true
  project.tagline = ""
  project.background_color = "#4085D4"
  project.project_description = ""
  project.product_description = ""
  project.result_description = ""
end
project.save!(:validate => false)


=begin
  { :title => "Greeneggs",
    :picture => "greeneggs_iphone.png",
    :featured => false,
    :url => "http://www.closeoutbike.com",
    :background_color => "#a5c675",
    :featured_picture => "greeneggs_img.png",
    :tagline => "Your bicycle shopping gets easier!",
    :permalink => "greeneggs",
    :index_picture => "greeneggs_result.png",

    :project_description => "",
    :product_description => "",
    :result_description => "",

    :link_disabled => nil },
=end