# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

unless Rails.env.production?
  require "rubocop/rake_task"

  RuboCop::RakeTask.new

  task default: [:spec, :rubocop]
end
