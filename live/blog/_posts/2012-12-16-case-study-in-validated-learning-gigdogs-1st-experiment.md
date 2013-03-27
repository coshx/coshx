---
layout: post
title: Case Study in Validated Learning GigDog's 1st Experiment
author: ben@coshx.com
---
## Background ##

The idea of [GigDog](http://gigdog.fm) is simple: we want to get more people going to local concerts by making it easy to learn the songs of bands that have upcoming shows. Implicit in this idea, however, are a few assumptions that deserve to be tested:

* **When people know the bands and music, they're more likely to go to a show.**
* **People will learn music and get to know bands by listening to their songs.**
* **People are willing to listen to the songs from upcoming gigs.**

The first hypothesis seems straightforward, that the more popular a band is, the more people they can attract to shows. Still, it will be worth testing how well popularity on GigDog can influence ticket sales once the site itself is more popular. Similarly, the second point is almost tautological, since we learn music by listening to it. It's worth stating this assumption, however, because it may be important to measure how well our platform allows listeners to learn the music.

While we intend to test the first two points as the site gains in popularity, we've decided to focus primarily on the third point, our **Value Hypothesis**.  In order to test this scientifically, we've developed two core metrics that we can try to optimize as we develop the site:

## Core Metrics ##

* **How many new users are clicking play?**
* **How long are new users listening?**

By focusing on cohorts of unique new users to the site, we aim to avoid the [dangers of vanity metrics](http://www.startuplessonslearned.com/2009/12/why-vanity-metrics-are-dangerous.html), so we can more accurately test how specific changes we make to the site affect the value that users get out of it.

In order to maximize the validity of these tests, we started gathering base metrics the first week that the site was live in beta (this is why there is no data for the first cohort about clicking play). Each cohort represents all the new users coming to the site within a week, where the median cohort size is 27 users.

## First Experiment - Click play, please! ##

![tutorial showing play button](http://i.imgur.com/hFWpT.png)
For our first experiment, we added a tutorial to the site for first-time users. The first step of the tutorial points out the play button, and asks users to click on it. We thought this would both increase the number of new users clicking play as well as decrease the time it takes users to click play (we have metrics for this, as well as some cool distribution graphs of how long it takes users to click play, but these are showing too much variance within the base metrics to draw any significant conclusions).

What we've found so far ends up being counterintuitive. The graph below shows our metric, with cohort 6 being the first cohort shown the tutorial. *The percentage of users clicking play is actually going down! Our assumption was wrong.*

![metrics for clicking play through cohort 6, showing fewer users clicking play in cohort 6](http://i.imgur.com/hmx4H.png)

Now, there could be several reasons for this decline, such as how the users were drawn to the site, local vs. non-local users (since the site makes much more sense to residents of the pilot city), or other unknown issues (like if we have a bug in certain browsers). Unfortunately, good qualitative feedback to answer the question **_why_** is harder to come by than good quantitative feedback. Still, this is good early evidence that a tutorial may not be the way to go. 

## Next Steps ##

In addition to collecting qualitative feedback (you know you have an opinion, and the comments section below is a great place to voice it, nudge nudge, wink wink), our next step is to try a different approach. With one foot planted solidly in the ground, we're going to pivot with the other foot, and try a split test between users getting the tutorial and users having another type of engagement (a simple welcome prompt where they choose a genre, causing that genre's playlist to start playing).

## Thoughts ##

I won't lie, these kinds of negative results are disheartening. We implemented what we thought was a good plan, and were expecting positive results along with a round of self congratulations. When you pour your heart into something, and work day and night on it, it's never easy to deal with these kinds of minor setbacks. But I'm also really happy to see these negative results, because it means we're saving an inordinate amount of time and money by realizing this so quickly. Imagine if we were in stealth mode, trying to perfect a tutorial over the next month, to roll it out along with other features a month after that? We'd be caught in a much worse position, with no idea what feature to blame. There's a good chance we'd continue to believe the tutorial was a worthwhile feature, sinking time and effort into perfecting it and coming up with alternate explanations of why we weren't getting more users clicking play.

Ultimately, I'm glad we failed fast, and would like to take my obligatory [failure bow](http://blog.agilityfeat.com/2011/10/failure-bows-and-brainstorming-from-accus/). In the larger picture, this is validation of our lean approach, and I hope all our future failures will be just as swift.
