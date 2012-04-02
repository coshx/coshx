# -*- coding: utf-8 -*-

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
  m.bio = "Prior to joining Coshx Labs, Mike developed web applications in subject areas as diverse as event registration and biofuel trading. As a front and back-end developer, he enjoys distilling complex problems into elegant and obvious interfaces that even your mother-in-law could use. Outside of work, Mike enjoys fly-fishing, mountain biking and playing fetch with Walker, his labrador retriever."
end
puts "Created User #{mike.name}"

david = Admin.find_or_create_by_email("david@coshx.com") do |d|
  d.name = 'David Kovsky'
  d.password = 'password'
  d.twitter = 'davidkovsky'
  d.github = 'davidkovsky'
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
  a.bio = "Anthony Burton is a DevOps <strike>ninja</strike> <strike>rockstar</strike> guy  who solves tough configuration problems in his sleep and eats lesser Linux distributions for breakfast. When not dishing out revenge on uncooperative servers, he spends time with his daughter and on a boat."
  a.github = "ajburton"
  a.twitter = "anthonyburton"
end
puts "Created User #{ant.name}"

calvin = Admin.find_or_create_by_email("calvin@coshx.com") do |c|
  c.name = "Calvin Delamere"
  c.password = "calvins_password"
  c.bio = "Although Calvin is the youngest software engineer at Coshx, he started programming nine years ago and built his first website eight years ago. In the last few years he has focused his computer science and applied math background on web development. In his free time, Calvin enjoys skiing, biking, bouldering, and ultimate frisbee. Calvin also enjoys crushing the competition at foosball."
end
puts "Created User #{calvin.name}"

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
  c.quote = "We engaged Coshx for a substantial, highly complex project having an incredibly tight deadline, and they came through for us wonderfully. Throughout they were thoughtful, flexible, highly responsive team players."
  c.quoted_person = "Steve Herrick, CIO"
  c.company_logo = "aar_logo.png"
end
puts "Created Client #{aar.name}"

tendril = Client.find_or_create_by_name("Tendril") do |c|
  c.site_url = "http://www.tendrilinc.com"
  c.quote = "I couldn't have gotten any of this off the ground without you guys. The company is in good shape because of the headstart Coshx provided."
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


# -----------------------------------------------------------------------------
# services
# the current way we show services necessitates them having a sorting order. We need the longer ones to be consecutive, otherwise the layout looks awful.
# using a sort order that is specified here is the simplest way to insure they show up in a consistently nice way.

service = Service.find_or_create_by_title("Startups") do |s|
  s.description = "We focus on lean startup tactics, helping you get to your Minimum Viable Product (MVP) in a timely, cost-effective manner. We understand that as your business develops, requirements can change drastically, so we develop in a transparent, agile manner to ensure that you always have a good grasp of the project timelines and budgets."
  s.sort_order = 1
end
puts "Created Service #{service.title}"

service = Service.find_or_create_by_title("Better Living Through Testing") do |s|
  s.description = "What's that, you need tests? While no one wants to admit it, sometimes teams forget to maintain their testing infrastructure, or project deadlines force more emphasis on features than the reliability of those features. In these cases, we come in and <ol><li>get tests passing</li><li>setup continuous integration testing</li><li>speed up tests</li><li>add tests where needed</li><li>coach team on TDD and BDD best-practices</li></ol>"
  s.sort_order = 3
end
puts "Created Service #{service.title}"

service = Service.find_or_create_by_title("DevOps") do |s|
  s.description = "We swear by PaaS solutions like Heroku and EngineYard for most of our deployments, but sometimes they're not appropriate. For these times, we can deploy and manage large clusters on EC2 or in specific datacenters. We have experience maintaining production systems using both chef and puppet, and are happy to discuss with you which solution is best for your needs."
  s.sort_order = 2
end
puts "Created Service #{service.title}"

service = Service.find_or_create_by_title("Scalability") do |s|
  s.description = "Having a site that's so popular you have to worry about scalability is a great problem to have... until your users start leaving. Or maybe you anticipate a large load and want to understand how your application will behave. We can help. We've managed systems that handle millions of requests a day, and get a kick out of load testing systems and services to push them to the limit.<ul><li>scalability tests (database)</li><li>load tests (concurrency, throughput)</li><li>database optimizations</li><li>architecture reivew and optimizations</li><li>profiling and bottleneck identification</li></ul>"
  s.sort_order = 4
end
puts "Created Service #{service.title}"

service = Service.find_or_create_by_title("Mobile") do |s|
  s.description = "Odds are pretty good that you own a smartphone. But even if you don't, odds are your customers do. Being able to engage with your users anywhere, anytime is an amazing opportunity - let us help you with crafting the right mobile solution, be it a mobile version of a website or a dedicated app."
  s.sort_order = 5
end
puts "Created Service #{service.title}"

service = Service.find_or_create_by_title("And so on...") do |s|
  s.description = "Think you need something else? Maybe some training for your team? Some refinement for your business plan? Perhaps a pet sitter? We might not be able to offer much on the last one there, but we'd be happy to hear any special requests you have. Just drop us a line at <a href=\"mailto:info@coshx.com\">info@coshx.com</a> and we'll get back to you right away."
  s.sort_order = 6
end
puts "Created Service #{service.title}"


