---
layout: post
title: Ignoring Local Changes to Tracked Files with Git
author: gabe@coshx.com
---
Most of us know we can use the `.gitignore` file to tell git to completely ignore certain untracked files, but what about tracked files?

## Example: Custom local Rails database configuration

Rails tries to be database-agnostic, so many Rails apps work happily with many flavors of SQL.  Brand-new Rails apps use SQLite by default, a good choice because it has no dependencies on system packages.  What happens when the time comes that you want to develop locally against Postgres instead?

## config/database.yml

Your Rails app database is configured in `config/database.yml` which is checked into git by default.  If you modify it to use Postgres, git will mark your database.yml as changed, cluttering up your `git status` and unwantedly staging your database.yml when you run `git add .` or `git commit -a`.

## Solution 1: Remove database.yml from the index and add it it to .gitignore

Simply `git rm --cached config/database.yml`, commit the removal with `git commit -a`, and add database.yml to .gitignore.  Perhaps copy the original database.yml to database.yml.example and add a note to your README about copying the example file after cloning the repo.

The problem with this solution is you're adding an extra step that others must take before running and contributing to you app, when really you only want to cause changes on your own machine.

## Solution 2: Mark database.yml as assume-unchanged in git's index

In fact git has the power to ignore local changes to tracked files, but it's slightly clunkier than and completely inconsistent with the familiar .gitignore.  You must use `git update-index` to tell git to ignore changes to the file:

```bash
$ git update-index --assume-unchanged config/database.yml
```

Now your git status will be clean, and you will have no unwanted results when you run things like `git add .` and `git commit -a`.  And when somebody upstream modifies database.yml, git will ask you to resolve the conflict.  Perfect.

To un-mark the file as assume-unchanged:

```bash
$ git update-index --no-assume-unchanged config/database.yml
```
 
And if you want a list of tracked files that git is ignoring:

```bash
$ git ls-files -v | grep ^[a-z]
```

Enjoy.
