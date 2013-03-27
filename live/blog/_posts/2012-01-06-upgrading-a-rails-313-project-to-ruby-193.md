---
layout: post
title: Upgrading a Rails 3.1.3 project to Ruby 1.9.3
author: davidkapp@coshx.com
---
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
