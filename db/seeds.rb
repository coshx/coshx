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
