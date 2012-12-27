#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Coshx::Application.load_tasks

 require 'heroku_san'

class AssetSyncStrategy < HerokuSan::Deploy::Base
  def deploy
    Rake::Task['assets:precompile'].invoke
    super
  end
end

HerokuSan.project = HerokuSan::Project.new(Rails.root.join("config","heroku.yml"), :deploy => AssetSyncStrategy)
