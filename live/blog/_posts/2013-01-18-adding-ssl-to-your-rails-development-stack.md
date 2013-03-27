---
layout: post
title: Adding SSL to Your Rails Development Stack
author: ryan@coshx.com
---
The biggest difference between the development and production stacks for most applications I've worked on has been the inclusion of 

```ruby
config.force_ssl = true
```

only in `config/environments/production.rb`. This seemingly small difference can be the source of many tough to catch redirect bugs. Up until now, enabling SSL in your development environment has been difficult to setup and required manually installing and configuring [nginx](http://nginx.com) or something similar to act as an SSL endpoint and reverse proxy.

I've been using 37Signals' excellent [Pow](http://pow.cx) server for development work for some time now. It's a simple solution for running all of your applications, and has been made even better with version 0.4's [xip.io](http://xip.io) integration. Xip.io makes it easy for any device on your local network to access your development server, perfect for testing mobile sites, Windows browsers, or giving demos.

The only problem with Pow - for me - has been the aforementioned difficulty setting up SSL. Until today, that is. Today I stumbled upon the wonderfully simple [tunnels](https://github.com/jugyo/tunnels) project. One command in a [screen](http://www.gnu.org/software/screen/) session is all you need to enable SSL for all of your Pow applications.

Out of the box, tunnels works perfectly for `*.dev` addresses, but does not properly respond when using xip.io. This is because tunnels binds to `127.0.0.1` by default, and the xip.io DNS directs your browser to your public IP address. The fix for that is quite easy. Simply start tunnels with:

```bash
$ sudo tunnels 0.0.0.0:443 80
```

Or, if you use [rvm](http://rvm.io):

```bash
$ rvmsudo tunnels 0.0.0.0:443 80
```

Now we're one step closer to running an identical stack in development and production and catching SSL bugs before your users do.
