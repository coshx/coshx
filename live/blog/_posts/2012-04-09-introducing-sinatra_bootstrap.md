---
layout: post
title: Introducing sinatra_bootstrap
author: ryan@coshx.com
---
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
