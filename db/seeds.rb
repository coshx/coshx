# -*- coding: utf-8 -*-
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
  b.twitter = 'coshx'
  b.github = 'btaitelb'
  b.bio = 'Almost two decades ago, twelve-year-old Ben reproduced the classic computer game <i>Nibbles</i>, providing hours of riveting entertainment. Since then, he has never strayed from manipulating technology for the benefit of its users. Having spent the last three years as the founder of a start-up company and then forming Coshx Labs, Ben is always on the lookout for meaningful, game-changing ideas! When he is not busy attempting to change the world, he may be found scaling the ascents of the Blue Ridge Mountains or serenading to the tunes of musicians from Josh Ritter to Johannes Brahms on his trusty violin.'
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

# -----------------------------------------------------------------------------
# clients

reframeit = Client.find_or_create_by_name("Reframe It") do |r|
  r.site_url = "http://reframeit.com"
  r.quote = "I think the software is working superbly... I think we have a great chance of spreading its application. Well done. The new version is everything I had hoped it would be."
  r.quoted_person = "Jim Fishkin, Reframe It Board Member"
  r.company_logo = "reframeit_logo.png"
end
puts "Created Client #{reframeit.name}"

aar = Client.find_or_create_by_name("American Academy of Religion") do |c|
  c.site_url = "http://www.aarweb.org"
  c.quote = "[Coshx was] very pleasant and professional."
  c.quoted_person = "Susan Snider, Associate Director of External Relations"
  c.company_logo = "aar_logo.png"
end
puts "Created Client #{aar.name}"

tendril = Client.find_or_create_by_name("Tendril") do |c|
  c.site_url = "http://www.tendrilinc.com"
  c.quote = "I couldn't have gotten gotten any of this off the ground without you guys. The company is in good shape because of the headstart Coshx provided."
  c.quoted_person = "Mike Bukhin, Tendril Software Czar"
  c.company_logo = "tendril_logo.png"
end
puts "Created Client #{tendril.name}"

abolish_cancer = Client.find_or_create_by_name("Abolish Cancer") do |c|
  c.site_url = "http://www.abolishcancer.com"
  c.quote = "While we were impressed with their technological knowhow, even more impressive was their willingness to spend countless hours helping to create, revise and get their hands dirty in the development of our plan."
  c.quoted_person = "Darah Bonham, Founder"
  c.company_logo = "abolish_cancer_logo.png"
end
puts "Created Client #{abolish_cancer.name}"

bypass_lane = Client.find_or_create_by_name("Bypass Lane") do |c|
  c.site_url = "http://bypasslane.com"
  c.what_we_did = "We teamed with Bypass Lane to create an API gateway that allowed them to expand their interaction with their clients."
  c.company_logo = "bypass_logo.png"
end
puts "Created Client #{bypass_lane.name}"