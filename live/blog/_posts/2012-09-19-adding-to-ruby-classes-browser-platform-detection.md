---
layout: post
title: Adding to Ruby Classes Browser Platform Detection
author: calvin@coshx.com
---
In this post I am going to show you how to add functionality to existing ruby classes such as arrays, strings and gems from a rails project by using an example that adds a little custom functionality to a browser detection gem.

<h4>Background</h4> 

The rails application has an API that supports iphone, ipad, android and web browsers- these are our platforms. We want to detect which platform a object is created from- lets say a comment.

<h4>Story Example</h4> 

As a market analyst, I want to see statistics on what platform a comment was created on, so I can analyze our comment activity across platforms.

<h4>Thought Process</h4>

After adding a field to store the platform in the database, there are a few ways to detect the platform. Hidden fields on each view with some text that says the platform would work, but finding and updating views in each project is a pain, hard to maintain, not very DRY etc. A better solution is to use the user agent from the request which in rails is available in controllers by calling `request.env["HTTP_USER_AGENT"]`. This will yield something like `Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.57 Safari/537.1` which we could then use regular expressions to match iphone, ipad, etc. 

I like regular expressions and writing a few to match different user agents would not be hard but I found a gem that already does just this - the <a href="https://github.com/fnando/browser" target="_blank">browser gem</a>. The gem even has rails integration making it super easy to use. 

<h4>Adding to the browser gem</h4>

Install the gem in your Gemfile and a nice helper method is added to rails controllers- "browser" which gives us a browser object from the gem. We can call methods like "browser.iphone?" and "browser.ipad" in our controller, but we don't want logic in the controller so lets write a method on the gem's Browser class to give us exactly what we want. To add a method to a class like String, Array, or Browser we can either define the method on the class in a file in config/initializers or in /lib and then require that file from a file that's in config/initializers. For example inside /config/initializers/extensions.rb I could have `require 'browser_gem_extensions' ` if i have the file `/lib/browser_gem_extensions.rb`. Make sure to restart rails when updating anything loaded at startup like config/initializers. There are a lot of different ways to add methods to classes, instances and objects in Ruby using meta programming but I just defined a method called platform on the Browser class like so to get loaded when
rails starts:

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

The platform method returns which of the supported platforms was used as described in our background section above. We can define methods on other Gems and Ruby core classes such as String like this. For example if rails did not provide the <a href="http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html" target="_blank">inflection library</a>, defining methods on String yourself like camelize and underscore could be very useful.

All that is left to do is update the controller. We can now add something like this to our params on the create method.

```ruby
  params[:comment][:created_on_platform] = browser.platform
  @comment = Comment.create(params[:comment])
```
All that is left is some type of view to display comment platform analytics now which I am not going to cover.

<h4>Extra Notes</h4>

-If your Iphone/Ipad requests are not made via UIWebView or the mobile browser, you will need to use an NSMutableURLRequest and set a custom header field for your user agent string to contain either iphone or ipad, other your user agent will look like `AppName/AppVersion CFNetwork/459 Darwin/10.0.0`. If you have previous ios versions and don't want to force an update, your platform method could return idevice if the user agent contains Darwin, otherwise your requests from Iphone/Ipad are going to be stored as web.


-What if we want this on multiple objects and/or controller actions such as update and create? Our platform method makes this easy without crowding our application controller, but we could be DRY with a before filter that is something like this

```ruby
  before_filter :store_platform, :on => :create

  def store_platform
    #hacky, assumes uris are all something like '/comments/...',  '/posts/...'
    object_name = request.request_uri.split('/')[1]
    #remove the s at the end
    object_name.chop!
    params[object_name][:created_on_platform] = browser.platform
  end
```

Not a good solution to get the object_name but works if your routes are all nice(you get the idea though)
