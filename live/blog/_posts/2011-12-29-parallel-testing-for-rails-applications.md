---
layout: post
title: Parallel Testing for Rails Applications
author: mike@coshx.com
---
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
