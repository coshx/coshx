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
  m.twitter = "mhickman84"
  m.github = "mhickman84"
  m.bio = "Prior to joining coshx labs, Mike developed web applications in subject areas as diverse as event registration and biofuel trading. As a front and back-end developer, he enjoys distilling complex problems into elegant and obvious interfaces that even your mother-in-law could use. Outside of work, Mike enjoys fly-fishing, mountain biking and playing fetch with Walker, his labrador retriever."
end
puts "Created User #{mike.name}"

david = Admin.find_or_create_by_email("david@coshx.com") do |d|
  d.name = 'David Kovsky'
  d.password = 'password'
  d.bio = "David loves watching online startups rapidly transform life as we know it for the better. An old C++ programmer, he shifted to Ruby several years ago so he could join the party. He loves the flow of writing clean code using TDD, pairing, and advocating agility internally and for established clients. Outside of work David enjoys climbing, cycling, kayaking, and spending time with his wife."
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

gabe = Admin.find_or_create_by_email("gabe@coshx.com") do |g|
  g.name = "Gabe Kopley"
  g.password = "gabes_password"
  #g.twitter = "kopley" # commented out per Gabe's request
  g.bio = "Powered by Groove Salad and other nutritious snacks, Gabe loves solving puzzles and building great web applications. Hackathons are his favorite, and he's a big fan of test-driven development, but prefers not to do both at the same time. Gabe's non-technical interests include outdoor recreation, live music, and alternative energy and building techniques."
  g.github = "gkop"
end
puts "Created User #{gabe.name}"

chielo = Admin.find_or_create_by_email("chielo@coshx.com") do |c|
  c.name = "Chielo Zimmerman"
  c.password = "chielos_password"
  c.bio = "Laying Ruby code like concrete blocks, Chielo is a builder by trade and obsession.  He enjoys working and finds it highly rewarding to deliver value and quality through beautiful programming."
end
puts "Created User #{chielo.name}"

ant = Admin.find_or_create_by_email("ant@coshx.com") do |a|
  a.name = "Anthony Burton"
  a.password = "anthonys_password"
  a.bio = "Anthony Burton is a DevOps ninja that solves tough configuration problems in his sleep and eats lesser Linux distributions for breakfast. When not dishing out revenge on uncooperative servers, he spends time with his daughter and on a boat."
end
puts "Created User #{ant.name}"

calvin = Admin.find_or_create_by_email("calvin@coshx.com") do |c|
  c.name = "Calvin Delamere"
  c.password = "calvins_password"
  c.bio = "Although Calvin is the youngest software engineer at Coshx, he started programming nine years ago and built his first website eight years ago. In the last few years he has focused his computer science and applied math background on web development. In his free time, Calvin enjoys skiing, biking, bouldering, and ultimate frisbee. Calvin also enjoys crushing the competition at foosball."
end
puts "Created User #{calvin.name}"

justin = Admin.find_or_create_by_email("justin@coshx.com") do |j|
  j.name = "Justin Van Eaton"
  j.password = "justins_password"
  j.bio = "The only member of the team to be called by his initials regularly, Justin is a skilled web developer with experience in many languages and frameworks. He has worked for and with multiple startups but is equally comfortable with large."
end
puts "Created User #{justin.name}"

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