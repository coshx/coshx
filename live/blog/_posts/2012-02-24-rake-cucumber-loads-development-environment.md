---
layout: post
title: rake cucumber loads development environment
author: ben@coshx.com
---
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
