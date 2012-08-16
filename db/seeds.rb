# -*- coding: utf-8 -*-

ben = Admin.find_or_create_by_email("ben@coshx.com") do |b|
  b.name = 'Ben Taitelbaum'
  b.password = 'password'
  b.twitter = 'coshx'
  b.github = 'btaitelb'
  b.bio = 'Almost two decades ago, twelve-year-old Ben reproduced the classic computer game <i>Nibbles</i>, providing hours of riveting entertainment. Since then, he has never strayed from manipulating technology for the benefit of its users. Having spent the last three years as the founder of a start-up company and then forming Coshx Labs, Ben is always on the lookout for meaningful, game-changing ideas! When he is not busy attempting to change the world, he may be found scaling the ascents of the Blue Ridge Mountains or serenading to the tunes of musicians from Josh Ritter to Johannes Brahms on his trusty violin.'
  b.img = "ben.png"
end
puts "Created User #{ben.name}"

mike = Admin.find_or_create_by_email("mike@coshx.com") do |m|
  m.name = 'Mike Hickman'
  m.password = 'password'
  m.twitter = "mhickman84"
  m.github = "mhickman84"
  m.bio = "Prior to joining Coshx Labs, Mike developed web applications in subject areas as diverse as event registration and biofuel trading. As a front and back-end developer, he enjoys distilling complex problems into elegant and obvious interfaces that even your mother-in-law could use. Outside of work, Mike enjoys fly-fishing, mountain biking and playing fetch with Walker, his labrador retriever."
  m.img = "mike.png"
end
puts "Created User #{mike.name}"

david = Admin.find_or_create_by_email("david@coshx.com") do |d|
  d.name = 'David Kovsky'
  d.password = 'password'
  d.twitter = 'davidkovsky'
  d.github = 'davidkovsky'
  d.bio = "David loves watching online startups rapidly transform life as we know it for the better. An old C++ programmer, he shifted to Ruby several years ago so he could join the party. He loves the flow of writing clean code using TDD, pairing, and advocating agility internally and for established clients. Outside of work David enjoys climbing, cycling, kayaking, and spending time with his wife."
  d.img = "david-kovsky.png"
end
puts "Created User #{david.name}"

dave_kapp = Admin.find_or_create_by_email("davidkapp@coshx.com") do |d|
  d.name = 'David Kapp'
  d.password = 'not_your_password'
  d.twitter = "Happymrdave"
  d.github = "davekapp"
  d.bio = "In a former life, Dave had a degree in Asian Studies and taught English in Japan. He was later reborn as a software developer and did C++ and Java for a few years before finding the awesomeness of Ruby and other dynamic languages. He lives in Littleton, CO with his fiance, Madeline, and two wonderful kitties. His spare time is eaten up by studying Japanese, videogames, manga, anime, and learning about new programming languages and techniques."
  d.img = "david-kapp.png"
end
puts "Created User #{dave_kapp.name}"

ryan = Admin.find_or_create_by_email("ryan@coshx.com") do |r|
  r.name = 'Ryan Ahearn'
  r.password = 'ryans_password'
  r.twitter = "rcahearn"
  r.github = "rahearn"
  r.bio = "Ryan got started programming with his first QBASIC class in high school and hasn't looked back since. He's tried his hand at most programming languages and is most passionate about finding the simplest solution to any given problem. When not working, Ryan participates in most every recreational sport he can find in Baltimore and cheers on the New York Giants and Yankees."
  r.img = "ryan.png"
end
puts "Created User #{ryan.name}"

gabe = Admin.find_or_create_by_email("gabe@coshx.com") do |g|
  g.name = "Gabe Kopley"
  g.password = "gabes_password"
  #g.twitter = "kopley" # commented out per Gabe's request
  g.bio = "Powered by Groove Salad and other nutritious snacks, Gabe loves solving puzzles and building great web applications. Hackathons are his favorite, and he's a big fan of test-driven development, but prefers not to do both at the same time. Gabe's non-technical interests include outdoor recreation, live music, and alternative energy and building techniques."
  g.github = "gkop"
  g.img = "gabe.png"
end
puts "Created User #{gabe.name}"

chielo = Admin.find_or_create_by_email("chielo@coshx.com") do |c|
  c.name = "Chielo Zimmerman"
  c.password = "chielos_password"
  c.bio = "Laying Ruby code like concrete blocks, Chielo is a builder by trade and obsession.  He enjoys working and finds it highly rewarding to deliver value and quality through beautiful programming."
  c.img = "chielo.png"
end
puts "Created User #{chielo.name}"

ant = Admin.find_or_create_by_email("ant@coshx.com") do |a|
  a.name = "Anthony Burton"
  a.password = "anthonys_password"
  a.bio = "Anthony Burton is a DevOps <strike>ninja</strike> <strike>rockstar</strike> guy  who solves tough configuration problems in his sleep and eats lesser Linux distributions for breakfast. When not dishing out revenge on uncooperative servers, he spends time with his daughter and on a boat."
  a.github = "ajburton"
  a.twitter = "anthonyburton"
  a.img = "anthony.png"
end
puts "Created User #{ant.name}"

calvin = Admin.find_or_create_by_email("calvin@coshx.com") do |c|
  c.name = "Calvin Delamere"
  c.password = "calvins_password"
  c.bio = "Although Calvin is the youngest software engineer at Coshx, he started programming nine years ago and built his first website eight years ago. In the last few years he has focused his computer science and applied math background on web development. In his free time, Calvin enjoys skiing, biking, bouldering, and ultimate frisbee. Calvin also enjoys crushing the competition at foosball."
  c.img = "calvin.png"
end
puts "Created User #{calvin.name}"

sang = Admin.find_or_create_by_email("sang@coshx.com") do |s|
    s.name = "Sang Won Seo"
    s.password = "sangs_password"
    s.twitter = "sws4q"
    s.github = "sws4q"
    s.bio = "Sang is an intern at Coshx. He is currently studying computer science at University of Virginia. Although he is not as experienced as other developers at Coshx, he is eager to learn more and grow as a developer. Other than programming, Sang enjoys weight training, listening to music, and playing instruments."
    s.img = "sang.png"
end
puts "Created user #{sang.name}"

mm = Admin.find_or_create_by_email("mikhail@coshx.com") do |s|
    s.name = "Michael Makarov"
    s.password = "password"
    s.twitter = ""
    s.github = "micmmakarov"
    s.bio = "Michael loves code, he worked in Japan with databases, he a huge front-end experience, and on his free time he teaches a Rails class in San Francisco"
    s.img = "sang.png"
end
puts "Created user #{mm.name}"


gil = Admin.find_or_create_by_email("gil@coshx.com") do |g|
  g.name = "Edi Gil"
  g.password = "gills_password"
  g.github = "edigil"
  g.img = "gil.png"
end

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


puts "Creating POSTS..."
#BLOG

post = Post.find_or_create_by_title('Startup Weekend: Charlottesville') do |post|
  post.title = 'Startup Weekend: Charlottesville'
  post.author_id = '4'
  post.created_at = '2012-03-25 04:14:32 UTC'
  post.posted_on = ''
  post.updated_at = '2012-03-25 04:14:32 UTC'
  post.body = <<EOF
How much can you accomplish in 54 hours? Odds are you can get a lot done - especially when you're collaborating with a group eager to crank out a full prototype in just a couple days. It's a blast and I encourage you to check out [their site](http://startupweekend.org/) and think about going.

So what's fun about it? Why would you give up a weekend to do something like this? First off, the community. It's a chance to schmooze and network, sure, but it's also a chance to band together with some like-minded folks and hammer out a project. You don't have time to do everything. You have to make compromises. But in the end you'll come out having learned a lot about something (what that something is will vary widely, and that's part of the fun) and you might even have something awesome to show for it.

So what did I do? I halfheartedly proposed something (and actually got some interest), but I ended up working with a group of nearly a dozen people on a mobile Facebook app that tries to turn social interactions and interests into a market simulation game. Sounds terribly startupy, right? That's the point! Try something quirky and run with it. We pivoted a little (WELL HELLO THAR BUZZWORD) but came away generally satisfied that we had an interesting idea.

Is it The Next Big Thing? Not yet. Did anyone make that mythical unicorn-like capital magnet of a viral product that all startups yearn to spin into the unsuspecting market? It's too soon to say - overnight success never really happens overnight. 
EOF
end
post = Post.find_or_create_by_title('Adding Gem Functionality: browser platform detection') do |post|
  post.title = 'Adding Gem Functionality: browser platform detection'
  post.author_id = '9'
  post.created_at = '2012-08-08 00:12:37 UTC'
  post.posted_on = ''
  post.updated_at = '2012-08-08 01:07:32 UTC'
  post.body = <<EOF
The problem I am going to tackle in this post is detecting browser info from a rails app, however concepts can be applied to other ruby projects, such as something built on Sinatra or even something not built on ruby.

<h4>Background</h4> 

The app supports iphone, ipad, android and browsers- these are our platforms. Our api is built on rails. We want to detect which platform a object is created from- lets say a comment.

<h4>Story</h4> 

As a market analyst, I want to see statistics on what platform a comment was created on, so I can analysis our comment activity across platforms... or something like that

<h4>Thought Process</h4>

After I made my migration, the first thought that popped into my mind was "hidden fields on each view with some text that says the platform". This will work, but finding and updating views in each project is a pain, hard to maintain, etc. I was given a hint and felt dumb right away for not thinking to use the request data- request.env["HTTP_USER_AGENT"] in rails. This will yield something like "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.57 Safari/537.1" which we could then use regular expressions to match iphone, ipad, etc. 

I like regular expressions but I knew I'd be reinventing the wheel, so I went searching for a gem and found the <a href="https://github.com/fnando/browser" target="_blank">browser gem</a>. The gem does what I just described and it even has rails integration. Winning.

<h4>Adding to the browser gem</h4>

Install the gem in your Gemfile and a nice helper method is added to rails controllers- "browser" which gives us a browser object from the gem. We can call methods like browser.iphone? in our controller, but we don't want this logic in the controller so lets write a method on the gem's Browser class to give us exactly what we want. To add a method to a class like String, Array, or Browser we can either define the method on the class in a file in config/initializers. Or do the same it in /lib and then require that file from a file that's in config/initializers. For example inside /config/initializers/extensions.rb I could have "require 'browser_gem_extensions' " if i have the file /lib/browser_gem_extensions.rb. I generally like requiring from lib because I have tests covering /lib and I feel the organization is better. I defined platform on the Browser class like so:

```ruby
class Browser

  def platform
    return "iphone" if iphone?
    return "ipad" if ipad?
    return "android" if android?
    return "web"
  end

end
```

The platform method returns which of the supported platforms was used as described in our background section above. All that is left to do is update the controller. We can now add something like this to our params on the create method.

```ruby
  params[:comment][:created_on_platform] = browser.platform
```
All that is left is some type of view to display comment platform analytics now which I am not going to cover.

<h4>1 last hint</h4>

What if we want this on multiple objects and/or controller actions such as update and create? I'd create a before filter something like this

```ruby
  before_filter :store_platform

  def store_platform
    object_name = request.request_uri.slice(0)
    object_name.chop!
    params[object_name][:created_on_platform] = browser.platform
  end
```

Getting the object name for the hash like i did is very hacky, what I did assumes request.request_uri is something like "/comments", "/posts", etc... I just couldn't find a better way from a quick brain and google search. If you think you have a good solution for this part let me know.
EOF
end
post = Post.find_or_create_by_title('The Cucumber Unicorn') do |post|
  post.title = 'The Cucumber Unicorn'
  post.author_id = '4'
  post.created_at = '2012-03-25 04:33:08 UTC'
  post.posted_on = ''
  post.updated_at = '2012-03-25 04:33:08 UTC'
  post.body = <<EOF
[Cucumber](http://cukes.info/) is a curious creature. It purports to bring together engineers and businesspeople; it mixes the oil and the water of the office.


Well, that's the theory at least. The bridge between the described and the code is still large even when you have a [gherkin](https://github.com/cucumber/cucumber/wiki/Gherkin) bridge crossing the descriptive and code chasm. I've used Cucumber on several projects but try as I might, the interest of the non-engineers in dipping their hands into the cuke has been less forthcoming than I hoped.


But recently! Oho! I was fortuitous enough to convince a team that using Cucumber to bridge the conceptual and technical realms was worth the unfamiliarity. 'Twas a wondrous experience; QA writing tests not in some clunky web tool, but right 
in the code! Planners planning in the thick of the mental fortress that coders build around their repositories.


If you ever come upon the Cucumber Unicorn, the chance to actually get the non-technical team members to take a stake and give a shake to adopting use of cucumber, don't pass it up. Don't let your cynicism over a few abandoned zucchinis make you lose faith. Not every team will adopt cucumber, as tasty and crunchy (and pleasant on a salad with a citrus dressing) as it may be. But when you have a tool that can bring your team together on a conceptual plateau more often, you should take advantage of it. You won't regret it.
EOF
end
post = Post.find_or_create_by_title('Removing Technical Debt') do |post|
  post.title = 'Removing Technical Debt'
  post.author_id = '3'
  post.created_at = '2012-04-09 19:00:28 UTC'
  post.posted_on = '2012-04-09 19:02:53 UTC'
  post.updated_at = '2012-04-09 19:02:53 UTC'
  post.body = <<EOF
I had a great time at the Mile High Agile 2012 conference. I thoroughly enjoyed and learned from every talk and heard almost 100% positive reviews of all the talks I missed out on in the other tracks. Many thanks to all who were involved in making it happen. I’ll definitely be back next year.

I want to write about one experience that really fired me up and kept me thinking for several hours afterwards. During one of the talks, the speaker gave us 3 minutes to talk amongst ourselves about how we might try to get rid of technical debt within the confines of an organization that doesn’t think it has time for any development work that doesn’t either add a visible feature or eliminate a visible defect.

At our table of about 8 people, 2 people seemed to think they each had a new way to magically sell management* on the importance and urgency of removing technical debt. They spent most of the 3 minutes talking about these magical methods.

I couldn’t help noticing several implications:

* Management doesn’t understand technical debt (but we can explain it to them if we talk very slowly and explain it just right).
* Developers aren’t allowed to remove technical debt (read: do their job) without permission from management (the people who still don’t understand technical debt).
* Any blame for the technical debt lies with management, not the developers who created it and are too scared to fix it.
* This situation will somehow improve someday if developers just keep what they’re doing.
* Nobody is sticking up for development in these organizations in the way I would expect a Scrummaster or a lead developer to.

With about 20 seconds left I finally vented through my mouth just enough to keep my head from exploding. The words that came out expressed that I wouldn’t waste my time asking for permission and would instead just do it, and maybe tout it after the fact as a good thing for the company, or not. I was swiftly shot down with “that’s really dangerous” from multiple people at the table and then time was up. Each table got one spokesperson to express the gist of their discussion and it wasn’t me. What a letdown!

This interaction stuck with me the rest of the day. I know my projects would have a ton of technical debt if I had to beg for permission to fix it or, worse, waste mental energy trying to think of clever new ways to beg for that permission because all previous attempts had failed.

I couldn’t help wondering what life would be like if I had to ask for permission to do other essential parts of my job. What if I had to ask management if I could use source control? Install a new editor? Test first? And should I expect management to pat me on the back if I do?

To be fair, getting rid of technical debt is always a judgment call. There are plenty of situations where it makes sense to leave it in. Many developers are overzealous in this department, just as non-technical management is traditionally underzealous.

In my opinion the decision of when to tackle technical debt should always be made on the development side. The extra upfront cost of doing so should already be reflected in the team’s velocity. This helps the team’s velocity stay fairly constant instead of dropping off exponentially due to excessive technical debt.

*In the context of our discussion, “management” seemed to refer to one or more non-technical persons “above” the developers in their organization who determine what visible features developers work on and when. I’ll use the term in the same way here.

EOF
end
post = Post.find_or_create_by_title('Introducing sinatra_bootstrap') do |post|
  post.title = 'Introducing sinatra_bootstrap'
  post.author_id = '5'
  post.created_at = '2012-03-26 03:43:55 UTC'
  post.posted_on = '2012-04-09 16:48:03 UTC'
  post.updated_at = '2012-04-09 16:48:03 UTC'
  post.body = <<EOF
[Sinatra](http://www.sinatrarb.com/) is a great way to quickly prototype
an idea or build one-off projects with minimum fuss. The only problem
I've ever encountered is remembering the exact format needed for your
application to get that initial push off the ground.

To solve that problem, I've thrown together [sinatra_bootstrap](https://github.com/rahearn/sinatra_bootstrap);
a quick and easy generator for those first few lines of code needed to get your idea out of your head and onto a
server.

There are three distinct types of output that sinatra_bootstrap can
generate.

Bare Bones
----------

    $ take_the_stage sinatra

Generates a `Gemfile` (containing only `sinatra`), and a `main.rb` file
with a sample `get '/'` block.

Rack Application
----------------

    $ take_the_stage sinatra --rackup

Same as the bare bones option, but now a `config.ru` file is generated,
making this option perfect for people who develop with a rack server
such as [pow](http://pow.cx).

Heroku-Ready
------------

    $ take_the_stage heroku

`main.rb` and `config.ru` are the same as the last output, but running
with the heroku option inclues thin, heroku, and foreman in the
`Gemfile` as well as creating a `Procfile` suitable for deployment onto
Heroku's cedar stack.

The output is purposefully simple, in line with sinatra's great strength
of being a beautifully simple and clean framework for getting things
done. There are other frameworks out there that do a great job of
setting up enough libraries to turn sinatra into a rails deployment.
EOF
end
post = Post.find_or_create_by_title('Polymorphic Associations and validate_uniqueness_of') do |post|
  post.title = 'Polymorphic Associations and validate_uniqueness_of'
  post.author_id = '5'
  post.created_at = '2012-03-23 22:24:12 UTC'
  post.posted_on = '2012-04-06 16:08:10 UTC'
  post.updated_at = '2012-04-06 17:12:03 UTC'
  post.body = <<EOF
One of my favorite helper libraries when testing is [thoughtbot's shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers). They do a great job making common situations easy to test in one line, but I recently ran into a gotcha with the `validate_uniqueness_of` matcher. Validating both uniqueness of a polymorphic association and another validation on the same association can cause some strange error messages regarding undefined classes due to the way scoping and validations are handled.

The Problem
-----------

For an example application, we have some classes that are related to each other with a polymorphic association. In this case, college students and courses. The uniqueness restriction comes in because we want to ensure that each student is only registered for the course once, but we want to make sure that an `UndergradStudent` and a `GraduateStudent` can both take the course at the same time even if they have the same `id`.

```ruby
# test
describe Enrollment do
  # valudate_uniqueness_of requires a previously created model
  before(:each) { Factory.create :enrollment }

  it { should validate_uniqueness_of(:course_id).scoped_to :enrollee_type, :enrollee_id }
end

# implementation
class Enrollment
  belongs_to :enrollee, :polymorphic => true
  belongs_to :course

  validates_uniqueness_of :course_id, :scope => [:enrollee_type, :enrollee_id]
  validates_presence_of :course
  validates_presence_of :enrollee
end

class UndergradStudent
  has_many :courses, :as => :enrollee
end

class GraduateStudent
  has_many :courses, :as => :enrollee
end

class Course
  has_many :enrollments
end
```

Perfect. Now we go ahead and run our uniqueness test and have a beer after a long day...

    Failures:

      1) Enrollment
         Failure/Error: it { should validate_uniqueness_of(:course_id).scoped_to :enrollee_type, :enrollee_id }
         NameError:
           uninitialized constant UndergradStudenu

Or not. UndergradStudenu? Where in the world did that come from?

The Source
----------

The source of this error is a combination of three things.

* How `ValidateUniquenessOfMatcher` changes the uniqueness scope.
* The fact that `AllowValueMatcher` calls `#valid?` on our model to see if the error message matches what is expected.
* The existence of `validates_presence_of :enrollee` in our code.

`ValidateUniquenessOfMatcher` generates a scope value that should not trigger a uniqueness error by using `#next`.

```ruby
next_value = if previous_value.respond_to?(:next)
  previous_value.next
else
  previous_value.to_s.next
end
```

`AllowValueMatcher` calls `#valid?` on our model.

```ruby
def errors_match?
  @instance.valid?
  @errors = errors_for_attribute(@instance, @attribute)
  @errors = [@errors] unless @errors.is_a?(Array)
  @expected_message ? (errors_match_regexp? || errors_match_string?) : (@errors.compact.any?)
end
```

The last piece of the puzzle is our `validates_presence_of :enrollee`. `@instance` from above is

```ruby
#<Enrollment id: nil, enrollee_id: 1, enrollee_type: "UndergradStudenu", course_id: 1>
```

Without the presence validation, we would never load the `enrollee` object and our test would pass. Without the full validation caused by calling `@instance.valid?` we would similarly never load the `enrollee` object and our test would pass. The combination means that the presence validator attempts to load the full enrollee object and cannot, because its type does not represent a real class.

The Workaround
--------------

Pleasing the matcher can be done by simply declaring `UndergradStudenu` as a class in the test file that inherits from one of the possible types of `enrollee`.

```ruby
describe Enrollment do
  # two lines to make the matcher happy
  class UndergradStudenu < GraduateStudent; end
  before(:each) { Factory.create :enrollment }

  it { should validate_uniqueness_of(:course_id).scoped_to :enrollee_type, :enrollee_id }
end
```

This allows the presence validation to continue without raising an error. And finally:

    1 example, 0 failures

EOF
end
post = Post.find_or_create_by_title('The ubiquity of NoSQL as presented by MongoDB') do |post|
  post.title = 'The ubiquity of NoSQL as presented by MongoDB'
  post.author_id = '4'
  post.created_at = '2012-03-25 03:50:30 UTC'
  post.posted_on = '2012-03-25 03:51:29 UTC'
  post.updated_at = '2012-03-25 04:16:04 UTC'
  post.body = <<EOF
Not so long ago I went to MongoDB Boulder, a one-day conference put on by 10gen, the company behind MongoDB. Aside from one panel I didn't get much out of, it was great. While I do have some experience using MongoDB, I not yet an expert with it (and I certainly have some team members here at Coshx Labs that know it better than I do), so I was looking forward to a chance to improve my skills.


The tech talks I went to were quite ideal for someone with my relative level of experience and I got a lot out of it. What I want to share with the internet at large, however, is more my surprise at who was attending the conference rather than what was said.


I was expecting the majority of the attendees to be developers or devops from smaller companies, startups, consulting companies, and the like. Those are the sorts of people I primarily think of when I imagine MongoDB users. I was wrong though. Very, very wrong - and I'm happy I was.


While there were people from the companies I just described, the majority of the attendees were from much larger companies, and there were several from places that have many thousands of employees. (I want to name some of them, but I know that many companies don't like having their tech stack discussed, so in the interest of kindness I'll refrain from naming specifics.) A higher-up at 10gen also discussed how MongoDB is starting to be used in government work as well, and he had a meeting coming up with a representative from the UK. That's far, far from what I would have imagined.


During the happy hour following the conference, I spoke with many attendees about what brought them there. Why MongoDB? Are you here out of curiosity or do you actually use MongoDB at the office? Some were there because they were considering MongoDB, some were already using it. The vast majority of them were there because the office wanted them to go, to at least get more information about whether MongoDB would be a good fit for them or not. Those who hadn't decided to use it or not yet were evaluating it against several of the other NoSQL databases you've probably heard of: Riak, CouchDB, Cassandra, HBase, and so on.


It's great to see so many highly-visible open source projects make their way into "The Enterprise." And to small companies as well of course - but smaller companies have been leaning heavily on tech like this to give them an edge in a fiercely competitive marketplace. Is MongoDB the right choice for them? It very well might be (if you haven't used MongoDB in a while, take a look at it again, it has had a lot of very impressive growth in the last year).


And if it's not, there's no shortage of other open-source data stores available for them to consider. NoSQL isn't always the right tool for the job, but it's often worth a look, and I'm really excited to see the adoption of it expand in enterprises large and small.
EOF
end
post = Post.find_or_create_by_title('Increasing Performance using Ajax') do |post|
  post.title = 'Increasing Performance using Ajax'
  post.author_id = '9'
  post.created_at = '2012-03-01 20:38:10 UTC'
  post.posted_on = '2012-03-01 21:11:33 UTC'
  post.updated_at = '2012-03-01 21:33:46 UTC'
  post.body = <<EOF
In this post I’m going to show how to use Ajax to get JSON to decrease page load times and make your site scale better. This example assumes you're using Rails, but the idea applies elsewhere as well.

<h4>Scenario</h4> You have an expensive call in your controller - it's slow and/or database intensive. Also, the data you get from this call is not actually needed when the page loads because it's displayed after the user interacts with the site.

<h4>Example</h4> You have a chart that has multiple views and a large data set. You need the initial view when the page loads but don’t need the data for the other views until the user changes views. This is a good time to use Ajax to get the data that the chart needs on demand.
(Notice I said "on demand." You could get the data when the page is done loading if you think the user will often do whatever is needed to make it appear. However, always making the expensive data call when the page is done does not scale as well - why get the data if you don't need it?)
<br><br><br>
<h3>Code sample</h3>
Here is some sample code I hacked up to get the idea across (note there is some hand waving in the javascript for the charts- let me know if you have improvements/code fixes for the example)

<h4>Data</h4> (This is just a simple example for demonstration purposes, pretend these are expensive database calls)

```ruby
class Chart
  def self.get_daily_data
    [5, 4, 7, 6, 5, 4]
  end

  def self.get_bi_daily_data
    [12, 10, 6, 7, 8, 5, 4, 7, 6, 5, 4]
  end
end
```
<h4>Controller</h4>
from:

```ruby
def show
  @daily = Chart.get_daily_data
  @bi_daily = Chart.get_daily_data
end
```

to:

```ruby
def show
  @daily = Chart.get_daily_data
end
def bi_daily
  render :json => Chart.get_daily_data
end
```

<h4>View (using haml)</h4>
from:

```haml
#daily_data{:style => "display:none;"}
  = @daily_data
#bi_daily_data{:style => "display:none;"}
  = @bi_daily_data
```
to:

```haml
#daily_data{:style => "display:none;"}
  = @daily_data
#url{:style => "display:none;"}
  = request.url
```
<h4>Javascript (using jquery/coffee script)</h4>
from:

```javascript
dailyData = $.trim($("#daily_data").html())
biDailyData = $.trim($("#bi_data").html())
chart = createChart(dailyData, "daily")
addDataToChart(chart, biDailyData, "biDaily")

$("#show_daily").click ->
  chart.hide("biDaily")
  chart.show("daily")
$("#show_bi_daily").click ->
  chart.hide("daily")
  chart.show("biDaily")
```
to:

```javascript
dailyData = $.trim($("#daily_data").html())
chart = createChart(dailyData, "daily")

$("#show_daily").click ->
  chart.hide("biDaily")
  chart.show("daily")

$("#show_bi_daily").click ->
  loadBiDaily() if chart.doesntHaveDataSeries("biDaily)
  chart.hide("daily")
  chart.show("biDaily")

loadBiDaily ->
  url = $.trim($("#url").html())
  #if the following is really slow you could use a loading wheel from http://ajaxload.info/
  biDailyAjax = $.getJSON( url + "/bi_daily", (biDailyData) ->
  addDataToChart(chart, biDailyData, "biDaily")
```
EOF
end
post = Post.find_or_create_by_title('`rake cucumber` loads development environment') do |post|
  post.title = '`rake cucumber` loads development environment'
  post.author_id = '1'
  post.created_at = '2012-02-24 19:24:29 UTC'
  post.posted_on = '2012-02-24 19:32:20 UTC'
  post.updated_at = '2012-02-24 19:58:18 UTC'
  post.body = <<EOF
This is one of those gotchas that can throw a developer for a bit of a loop (at least it just threw me for a loop for the past half hour).

If you run cucumber tests from the command line:

```bash
% cucumber features
```
then `Rails.env.test?` will be set as expected and `config/environments/test.rb` will be loaded.

However, if you run:

```bash
% rake cucumber
```
then `Rails.env.test?` will be false, and `config/environments/development.rb` will be loaded.


### Workarounds
Currently, there are a couple simple workarounds if you want both to behave similarly:

#### 1) be explicit
  - `RAILS_ENV=test rake cucumber` 
  - annoying to have to remember, but hey, that's what aliases are for, right?

#### 2) <strike>Update the cucumber rake task</strike>
  *EDIT: while this correctly sets `Rails.env`, rails still loads development.rb afterwards*  
  - add the following to the `cucumber:ok` task in `lib/tasks/cucumber.rake`:

```ruby
namespace :cucumber do
  Cucumber::Rake::Task.new({:ok => 'db:test:prepare'}, 'Run features that should pass') do |t|
    ENV['RAILS_ENV'] ||= 'test'
    Rails.env = ActiveSupport::StringInquirer.new(ENV['RAILS_ENV'])
```

### Notes
 - This doesn't occur with rspec, so somehow that gem has gotten the load order correctly. If you know what rspec-rails is doing that cucumber-rails isn't, please point me in the right direction in the comments.
 - I've tested with both rails 3.1 and 3.2.1 and seen the same behavior.
 - Thanks to [rails-env-vs-rails-env on stackoverflow](http://stackoverflow.com/questions/2715035/rails-env-vs-rails-env) for the tip on `Rails.env`
EOF
end
post = Post.find_or_create_by_title('Installing tsung with homebrew on osx') do |post|
  post.title = 'Installing tsung with homebrew on osx'
  post.author_id = '1'
  post.created_at = '2012-01-31 18:25:07 UTC'
  post.posted_on = '2012-01-31 18:27:04 UTC'
  post.updated_at = '2012-01-31 18:27:04 UTC'
  post.body = <<EOF
### Problem

I recently tried installing [tsung](http://tsung.erlang-projects.org) via homebrew on OSX Lion, but got the following error:

```bash
% brew install tsung
==> Downloading http://tsung.erlang-projects.org/dist/tsung-1.4.1.tar.gz
File already downloaded in /Users/btaitelb/Library/Caches/Homebrew
==> ./configure --prefix=/usr/local/Cellar/tsung/1.4.1
==> make
==> make install
make -C doc
make[1]: Nothing to be done for `all'.
-n build main app boot script ... 
make: *** [priv/tsung.boot] Error 1
==> Exit Status: 2
http://github.com/mxcl/homebrew/blob/master/Library/Formula/tsung.rb#L15
==> Environment
[edit: environment ommitted]

Error: Failed executing: make install 
If `brew doctor' does not help diagnose the issue, please report the bug:
    https://github.com/mxcl/homebrew/wiki/checklist-before-filing-a-new-issue
```

### Solution

I was using the latest version of erlang (R15B), so uninstalled that and rolled back to a previous version:

```bash
% brew rm erlang
Uninstalling /usr/local/Cellar/erlang/R15B...

% brew versions erlang
R15B     git checkout 12b8d77 /usr/local/Library/Formula/erlang.rb
R14B04   git checkout aedacdf /usr/local/Library/Formula/erlang.rb
R14B03   git checkout 9332ca9 /usr/local/Library/Formula/erlang.rb
R14B02   git checkout b782d9d /usr/local/Library/Formula/erlang.rb
R14B01   git checkout 0476235 /usr/local/Library/Formula/erlang.rb
R14B     git checkout 7871a99 /usr/local/Library/Formula/erlang.rb
R13B04   git checkout 31f1fab /usr/local/Library/Formula/erlang.rb
R13B03   git checkout 729f3fa /usr/local/Library/Formula/erlang.rb
R13B02-1 git checkout 0d673c6 /usr/local/Library/Formula/erlang.rb
5.7.2    git checkout e60e1d7 /usr/local/Library/Formula/erlang.rb
02       git checkout 5d7cab9 /usr/local/Library/Formula/erlang.rb
01       git checkout 1038860 /usr/local/Library/Formula/erlang.rb
R13B     git checkout d1539e3 /usr/local/Library/Formula/erlang.rb

% cd /usr/local/Library/Formula
% git checkout aedacdf /usr/local/Library/Formula/erlang.rb
% brew install erlang
% brew install tsung
==> Downloading http://tsung.erlang-projects.org/dist/tsung-1.4.1.tar.gz
File already downloaded in /Users/btaitelb/Library/Caches/Homebrew
==> ./configure --prefix=/usr/local/Cellar/tsung/1.4.1
==> make
==> make install
/usr/local/Cellar/tsung/1.4.1: 280 files, 2.8M, built in 114 seconds

```

EOF
end
post = Post.find_or_create_by_title('The $50,000 Blog Post') do |post|
  post.title = 'The $50,000 Blog Post'
  post.author_id = '6'
  post.created_at = '2012-01-21 05:36:40 UTC'
  post.posted_on = '2012-01-21 07:23:43 UTC'
  post.updated_at = '2012-01-23 02:09:31 UTC'
  post.body = <<EOF
Talented engineers are necessary but not sufficient for the success of a technology company, and no amount of technical brilliance will save an organization laden with process debt.  Here are some process fixes that could save your company tens of thousands of dollars or more.





#### 1.  Choose your project management software carefully

A bad project management application will add friction to your planning and execution that is hard to overcome.  Apply the same usability standards to which you hold your own product when evaluating candidate tools.  Make sure your engineers _and_ your managers enjoy and benefit from the project management software you select, or you will lose countless hours to miscommunication and lose your best engineers to low morale.  If in doubt, use the good old whiteboard and Post-it notes instead.

#### 2.  Allow different tools for different jobs

An opinionated operations team is a huge asset for a web company, but can become an even larger liability if permitted to dictate technology choices in other departments.  For example, Fedora might be the right choice in the datacenter, but that doesn't mean developers should be discouraged from using Ubuntu for local applications.  The idea is empowering your employees by allowing each one to select the best tool for his or her particular job.

#### 3.  Never compromise your technical values for an old-fashioned client

Cutting-edge technology companies can offer tremendous value even to technically-conservative customers.  When taking on such clients, carefully protect them from aspects of your agile methodology that might frighten them.  For instance, be sure to keep your continuous deployments internal and deliver only scheduled releases and critical hotfixes.

#### 4.  Filter your clients' requested changes through your product team

Don't depend on your engineers to distinguish between defects and enhancements.  Instead, delegate a member of your product team to vet change requests before submitting them to engineering.  This will keep control of the direction of the product in the proper hands and save your engineers from performing work beyond your obligation to the client.

#### 5.  Evolve your process as your organization grows

Be realistic.  A company with 100 employees can't behave like the cozy start-up it was last year.  Foster an environment that promotes cross-team interaction without requiring company-wide meetings that stop the world.
EOF
end
post = Post.find_or_create_by_title('Upgrading a Rails 3.1.3 project to Ruby 1.9.3') do |post|
  post.title = 'Upgrading a Rails 3.1.3 project to Ruby 1.9.3'
  post.author_id = '4'
  post.created_at = '2012-01-06 19:42:56 UTC'
  post.posted_on = '2012-01-06 20:10:40 UTC'
  post.updated_at = '2012-01-10 19:55:29 UTC'
  post.body = <<EOF
Ruby 1.9.3 came out at the tail end of October 2011. In addition to the library updates (see [here](http://www.ruby-lang.org/en/news/2011/10/31/ruby-1-9-3-p0-is-released/)),
it brings some nice performance enhancements as well. One of these enhancements is a fix to the way requiring things is handled, which can speed up the start time of
Rails (server/console/etc) quite significantly. Since we have a growing suite of tests that we wanted to run more quickly (don't we all?) and we wanted to spend less time
at the terminal waiting for things to start (again, don't we all?) we wanted to upgrade to 1.9.3 when time allowed.

When I tried out Ruby 1.9.3 as soon as it was released, I had some problems getting [ruby-debug](http://bashdb.sourceforge.net/ruby-debug.html) to work. It seems that the way
some symbols are handled inside the Ruby source has changed, so ruby-debug doesn't quite work with 1.9.3 yet. Well, not quite. The versions of some libraries ruby-debug uses,
linecache19 and ruby-debug-base19, have been updated already but those versions simply aren't on Rubygems.org yet. (I'm assuming they're still being tested.) This leaves you with 
a few options if you want to be able to use a debugger with Rails 3.1 but you want to use Ruby 1.9.3:

1. use the built-in Ruby debugger instead of a library
2. install the updated versions of several libraries manually
3. use a different debugger

The first option there isn't especially appealing as it's not convenient or all that nice to use with Rails (the default debugger for Rails is ruby-debug). So I tried the second. After some
struggle, I got things working. I ended up going with option number three - we switched over to using [Pry](http://pry.github.com/) and [pry-nav](https://github.com/nixme/pry-nav). Here's how to do both of those
things in case you want to try either of them out.

Getting ruby-debug working with Rails 3.1 and Ruby 1.9.3 right now
==================================================================

[This gist](https://gist.github.com/1331533) was the key to making things work - but you need to 'fool' Bundler into using the versions of the gems
you're installing manually. There might be a way to have the gems locally and load them using the :path directive in Bundler, but that didn't work for me; I kept getting strange
path loading problems when I did that. I don't know if you need to install all four of these gems manually or not, but that's what the gist suggested and it worked for me. I'm also
not sure if archive-tar-minitar is really needed or not, but tried it as suggested anyways.
Here's what I did step-by-step:

1) download the files as listed in that gist from the [ruby-debug page](http://rubyforge.org/projects/ruby-debug19/):

        linecache19-0.5.13.gem
        ruby_core_source-0.1.5.gem
        ruby-debug19-0.11.6.gem
        ruby-debug-base19-0.11.26.gem

2) edit your Gemfile and comment out the line loading ruby-debug. It's probably something like

        gem "ruby-debug19", :require => "ruby-debug"

3) using gem directly, uninstall linecache19, ruby_core_source, ruby-debug19, and ruby-debug-base19.

4) export a variable pointing to your Ruby 1.9.3 source - if you're using [RVM](http://beginrescueend.com/), this will probably work:

    export RVM_SRC=$rvm_path/src/ruby-1.9.3-p0

5) now install all the gems:

    gem install archive-tar-minitar
    gem install ruby_core_source-0.1.5.gem -- --with-ruby-include=/$RVM_SRC
    gem install linecache19-0.5.13.gem -- --with-ruby-include=/$RVM_SRC
    gem install ruby-debug-base19-0.11.26.gem -- --with-ruby-include=/$RVM_SRC
    gem install ruby-debug19-0.11.6.gem -- --with-ruby-include=/$RVM_SRC

6) edit your Gemfile again and uncomment the line loading ruby-debug

7) try running 'rails server' or the like (in development mode, since you shouldn't be enabling the debugger in production anyways) and it should work!

This required manual intervention and I didn't really like that, so I looked into other debuggers for now (I think ruby-debug is great - but we wanted to update right away rather than
wait for the latest versions of these gems to show up on Rubygems). The most obvious choice was [Pry](http://pry.github.com/), so...


Debugging using Pry and Rails 3.1 with Ruby 1.9.3
=================================================

If you haven't tried out Pry yet, take a look. It's an interesting project that uses a directory metaphor to allow you to explore the Ruby object space. It's more of a 
substitute for IRB than it is a debugger, but you can add debugger like features using other gems. The two most prominent choices I found were [pry-debug](https://github.com/Mon-Ouie/pry_debug) and [pry-nav](https://github.com/nixme/pry-nav). The latter was simpler and offered everything I needed, so I elected to use it.

The good news about Pry and pry-debug is they build just fine with Ruby 1.9.3 right away - no Bundler tricks needed. Just add them to your Gemfile:

    gem "pry", "~> 0.9.7"
    gem "pry-nav", "~> 0.0.4"
    
Then do a bundle install and you're set. Note that you start Pry with <some object>.pry - generally binding.pry - but we normally use "debugger" in our code. To help ease the transition I added a debugger command that we'll use for the time being. This starts you inside a method rather than right where you had your debugger command, but it's 'good enough':

    unless Rails.env == "production"
      class Object
        def debugger
          binding.pry # Just type "next" and press enter to get to your debugging session as you expected :)
        end
      end
    end
    
We just started using Pry, so I can't say how I feel about it quite yet (initial impressions are very positive though), but it did succeed at giving us debugging capabilities
without manual intervention for now.

That's All For Now
==================
 
I hope this helps out if the holdup for you to move over to Ruby 1.9.3 was ruby-debug. We've very happy with the performance improvements in 1.9.3 and I'd definitely recommend it to others.
EOF
end
post = Post.find_or_create_by_title('Our First Birthday Party') do |post|
  post.title = 'Our First Birthday Party'
  post.author_id = '3'
  post.created_at = '2012-01-05 00:41:05 UTC'
  post.posted_on = '2012-01-05 00:41:31 UTC'
  post.updated_at = '2012-01-10 19:55:29 UTC'
  post.body = <<EOF
Last week we did something a little different for our tech lunch. We celebrated our first birthday as a company with a recap and, of course, a retrospective. This was a very exciting milestone so I wanted to share some of my thoughts about it here as well.

TL;DR: It’s been a great, amazing year that exceeded my dreams.

We grew from 5 to 10 people and worked with many others throughout the year, including 3 summer interns. We did work for at least 10 different clients. Our work included Agile coaching and planning, Android development, DevOps, and of course lots of Ruby on Rails. Collectively, we participated in countless conferences, community events, training days, and more. We did a tech lunch nearly every week. We held 2 2-day hackathons.

At 10 people, Coshx continues to feel to me like a small company where anyone who cares is empowered to take initiative and free to make a difference. We currently have 3 full-timers in Boulder, 3 in Charlottesville, and remote workers in Baltimore and Taos.

Our goals for 2012 include opening our tech lunches to a wider audience, doubling our hackathons, blogging a lot more, diversifying our technologies used, and speaking at events more often. In about a year we’ll grade ourselves on these goals and issue ourselves a report card here.

Through our work for our clients, we are helping people save energy in their homes, fight cancer, organize a huge conference on religion, use their smart phones to avoid waiting in line at coffee shops, and much more.

Most of the year we had to explain that we were so busy working for our clients that our own website was just a placeholder. Towards the end of the year we finally launched a real website as well.

If you’ve read this far then perhaps you’re interested in learning more about our services, working with us, attending our tech lunches, or something else? If so, please contact us. We’d love to hear from you.

EOF
end
post = Post.find_or_create_by_title('Parallel Testing for Rails Applications') do |post|
  post.title = 'Parallel Testing for Rails Applications'
  post.author_id = '2'
  post.created_at = '2011-12-29 01:35:21 UTC'
  post.posted_on = '2011-12-29 01:36:52 UTC'
  post.updated_at = '2012-01-10 19:55:29 UTC'
  post.body = <<EOF
Speed your RSpec, or Cucumber tests up by spreading them across multiple cores.











####Initial Setup

*1. Add dependency to Gemfile:*

in Gemfile:

```ruby
group :development, :test do
  gem 'parallel_tests'
end
```

Simply running "bundle install" should take care of all necessary dependencies.

*2. Configure your test environment to use multiple databases when running in parallel:*

in config/database.yml:

```yaml
test:
  database: your_test_db_name<%= ENV['TEST_ENV_NUMBER'] %>
```

*3. Create additional databases (one per processor core):*

```bash
rake parallel:create
```

*4. Copy your current schema to the additional databases:*

```bash
rake parallel:prepare
```
This command applies your current schema to all of the databases in your test environment.  This must be run whenever your schema is updated in order to ensure that the additional databases created by parallel_tests are current.

*5. Run a separate capybara server for each process (Capybara Only)*

in env.rb:

```ruby
Capybara.server_port = 8888 + ENV['TEST_ENV_NUMBER'].to_i
```

####Run your tests!

RSpec

```bash
rake parallel:spec
```

Cucumber

```bash
rake parallel:features
```

####Even Process Runtimes
The parallel_tests gem has the ability to intelligently partition your tests among your system's available processors.  If enabled, this feature will record the runtime of each test and attempt to minimize the total runtime of your test suite. To enable partitioning, add this to your rspec configuration options file:

in spec/parallel_spec.opts or spec/spec.opts:

```yaml
  --format progress
  --format ParallelSpecs::SpecRuntimeLogger --out tmp/parallel_profile.log
```

####Gotchas
If you have a large and complex test suite, it's likely that you will see some additional failures when you run your tests in parallel for the first time.   Shared resources are a likely culprit for these unexpected failures.  The parallel_tests gem does an excellent job of sandboxing your Rails app and its underlying database, but it has no way of knowing about shared state that exists elsewhere in the application (such as the file system).  

I ran into this issue recently after installing parallel_tests in a Rails 3 application for one of our clients.  After the initial setup, I was getting anywhere from 3-10 test failures while running the suite in parallel.  As it turns out, file generation was the issue.  Some of the tests were outputting generated files to a temp directory (and subsequently clearing that directory).  Occasionally one process would create a file and and attempt to verify its contents.  Before that could complete, a second process would go in and clear said directory, leaving the first process without the file it was expecting (FAIL!).

Fortunately, the parallel_tests gem exposes a handy environment variable that helps to solve these types of issues:

```ruby
ENV['TEST_ENV_NUMBER']
```

This variable will return a number string that is unique to each sandboxed test environment (one per processor / core).  Appending the environment variable to the temp directory fixed the issue mentioned above by creating a sandboxed directory for each test process.

Another item worth mentioning concerns the ordering of tests.  When running in parallel (particularly if the aforementioned runtime logging / optimization is enabled), your tests may run in an order that is completely different from the default.  This may lead to some unexpected failures if your tests are carrying any type of state around.  If you experience unanticipated failures after the initial setup of parallel_tests, be aware that your tests are likely being run out of their typical (default) order, and don't immediately assume that concurrency is at fault.
EOF
end
post = Post.find_or_create_by_title('How to Train Your Startup CTO') do |post|
  post.title = 'How to Train Your Startup CTO'
  post.author_id = '1'
  post.created_at = '2011-12-06 21:54:57 UTC'
  post.posted_on = '2011-12-06 21:55:16 UTC'
  post.updated_at = '2012-01-10 19:55:29 UTC'
  post.body = <<EOF
Congratulations, you're now the CEO of your own startup. You have a great idea and are experiencing the entrepreneurial drive. You don't know exactly how big it's going to get, but in the back of your mind you're picturing some tropical resort with soft pink sand, where you'll be enjoying drinks with fresh fruit and tiny umbrellas.

You've done the market analysis, put together a business plan, incorporated, found some startup funds, and you've even found a kick-ass programmer who believes in your vision and wants to build out your idea. You've been using computers your whole life, so you have a good idea of how the app should work (it should be simple, of course), and even have some ideas about how it should look ([it should be edgy, and pop](http://theoatmeal.com/comics/design_hell)).

Now you're starting to talk about the site, and you want a button to be placed in a specific location. You ask your programmer to do that and he tells you to stop designing. He might even say you should focus on the _what_ rather than the _how_, **but _what_ you want is a friggin' button, not this kind of attitude from your workers!**. This can quickly devolve into a few scenarios, all of which are damaging to your business goals:

 1. (**fight**) you keep making requests, and they keep getting ignored (or the solutions that are built don't satisfy your requests)
 1. (**flight**) you stop focusing on the product entirely
 1. (**complacency**) your programmer gives in and builds everything exactly as you ask

Wait, what?! Isn't that last point exactly what you want? If it is, then you need some coaching as well. Remember, what you really want is to meet your business goals, and solve the problem you set out to solve. The fact that you hired people to build that idea instead of building it yourself should be a good indicator that while you're an expert in the problem domain, you're not an expert in the solution domain. **If your technical lead is complacent, then you're the one developing the solution, and it will be sub-par.**

The problem is that you've been treating your technical expert as a _worker_ (just a _programmer_), when he sees himself as a creative problem solver (an _engineer_). When you set up this kind of relationship, where you're the only creative thinker (the _idea man_), you're setting your company up for failure. You need all of the creativity and expertise you can use in order to succeed, and it's your job to facilitate this creativity and direct it towards meeting your business goals.

So how do you promote creative problem solving while still making sure you meet your business goals? Obviously, it's a complex issue, and several [people](http://www.danpink.com/drive), [companies](http://gettingreal.37signals.com/) and [movements] (http://en.wikipedia.org/wiki/Lean_Startup) have great ideas about solving this issue.

Here's a simple recipe that I try to follow. It's by no means complete, but serves as a good basis for communication:

1. Establish roles and responsibilities
    * **CEO** - it's your job first and foremost to make sure the company stays afloat (has cashflow). You're probably also going to be the Product Owner.
    * **CTO** - if you grow big, this role will likely turn into a policy position, but right now you need to build the thing. Decide if this is a position you even need right now. If they're a co-founder, then sure, it makes sense to be on equal footing, both with a board position. Personally, I think it's funny to have these big fancy titles when your operating budget amounts to a credit card and frozen pizza.
    * **VP Engineering** - still sounds important, but I think is clearer in the expectation that the role is about making sure the product gets built.
    * **Product Owner** - I like using this term from the agile world, because unlike roles such as _product manager_ or _program manager_, it has a consistent definition and defines a responsibility more than a role (you want to be lean, so you should have more engineers than managers right now if your primary goal is to build the darn thing). You're the domain expert, so it makes sense for you to be in this role for now. Putting someone else here has the risk of creating a rift between you and engineering, but can work if you give this person autonomy in making product decisions.

1. Establish product description process
    * It's all about the **business value** (the problem you're solving), not about buttons and widgets
		    - when engineers know what problem you're trying to solve (e.g. the problem isn't implementing OAuth, it's about connecting 3rd parties to your service), they'll be able to make smarter decisions about implementation.
    * [**User Stories**](http://en.wikipedia.org/wiki/User_story) are a great tool for this, because they help you separate the problem you're trying to solve from the actual implementation.
       - be ready to give and take in terms of the level of granularity you're willing to specify
        - keep them small, so you can iterate quickly
        - ask yourself, if the bare minimum is implemented so I can accomplish what's in the story, will this bring the value I want?
        - as product owner, it's your responsibility to accept or reject work done based on this
        - you can always create new stories (and trust me, when you start seeing the product, you'll get lots of new ideas)
    * **Acceptance Tests** are great as well, especially when tied to stories
        - these are great for starting off, as they provide an objective, testable goal
        - as communication improves, you may be able to forego these in favor of better uses of your time
    * User Stories aren't perfect
        - it takes time and communication to figure out just what needs to be written down
        - communicate with the technical lead about how the stories are working
        - be willing to try improvements to the process (e.g. more/less descriptive, more/less acceptance criteria)
    * Don't describe everything up front
        - there will be time to work out all the details that are in your head
        - for now, focus on the Minimum Viable Product (MVP) -- the smallest thing that can still meet your business goals
    * **Prioritize**
        - engineers tend to prioritize in a logical manner (e.g. a user should login before he starts using an application that requires a login), but this isn't necessary during development, since you can mock up a logged in user
        - what's the most important part of the app that can convey your business value? build this first!
1. Demand Transparency
    * While it's great to be able to ask your technical lead what the team's velocity is, you should be able to look at the project and determine this yourself.
    * When people aren't transparent, it's usually because they have something to hide. Bring this to the surface and discuss why they feel the need to hide.
    * As stories are completed, you should be able to start playing with them and testing them on your own. Remember, your users won't have an engineer telling them how to use the app (and they're probably not going to read the manual either).
    * You need to be transparent about your operations as well in order to maintain a culture of transparency. Obviously some data (like shareholder and payroll records) is better kept private, but having things like meeting notes, sales data, and idea backlogs out in the open is great for team morale.

1. Give Autonomy
    * Once you've described the problem to be solved, let your creative thinkers solve it in the way they feel is most appropriate.
    * **Autonomy != Isolation** - this goes back to transparency: while you've made it clear that technical decisions are the responsibility of your engineering team, you will often have valuable input about domain and budget constraints.
    * It's great to talk about pros and cons of decisions openly, but it's also important to trust your coworkers. If you don't trust them, why'd you hire them?

1. Respect
    * When your actions convey respect towards others on your team, you'll find that they return that respect. I'm not talking about calling you "sir", but real respect like seeking out your advice and opinions about implementations.
    * If you don't sense respect, open up dialog and try to get to the root of it. If that fails, well, you're the boss, you know what to do.

EOF
end

puts "And now we need to publish posts that we have created"

posts = Post.all
posts.each do |p|
  puts "Publishing post '#{p.title}'"
  post_date = p.posted_on
  p.publish
  p.posted_on = post_date
  p.save!
end






