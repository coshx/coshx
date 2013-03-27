---
layout: post
title: How to Train Your Startup CTO
author: ben@coshx.com
---
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
