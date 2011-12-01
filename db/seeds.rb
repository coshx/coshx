# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ben = Admin.find_or_create_by_email("ben@coshx.com") do |b|
  b.name = 'Ben Taitelbaum'
  b.password = 'password'
end
puts "Created User #{ben.name}"

mike = Admin.find_or_create_by_email("mike@coshx.com") do |m|
  m.name = 'Mike Hickman'
  m.password = 'password'
end
puts "Created User #{mike.name}"

david = Admin.find_or_create_by_email("david@coshx.com") do |d|
  d.name = 'David Kovsky'
  d.password = 'password'
end
puts "Created User #{david.name}"

dave_kapp = Admin.find_or_create_by_email("davidkapp@coshx.com") do |d|
  d.name = 'David Kapp'
  d.password = 'not_your_password'
  d.twitter = "Happymrdave"
  d.github = "davekapp"
  d.bio = "In a former life, Dave had a degree in Asian Studies and taught English in Japan. He was later reborn as a software developer and did C++ and Java for a few years before finding the awesomeness of Ruby and other dynamic languages. He lives in Littleton, CO with his fiance, Madeline, and two wonderful kitties. His spare time is eaten up by studying Japanese, videogames, manga, anime, and learning about new programming languages and techniques."
end
puts "Created User #{dave_kapp.name}"

ryan = Admin.find_or_create_by_email("ryan@coshx.com") do |r|
  r.name = 'Ryan Ahearn'
  r.password = 'ryans_password'
  r.twitter = "rcahearn"
  r.github = "rahearn"
  r.bio = "Ryan got started programming with his first QBASIC class in high school and hasn't looked back since. He's tried his hand at most programming languages and is most passionate about finding the simplest solution to any given problem. When not working, Ryan participates in most every recreational sport he can find in Baltimore and cheers on the New York Giants and Yankees."
end
puts "Created User #{ryan.name}"