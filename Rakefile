#!/usr/bin/env rake

require 'rake/clean'
require 'rspec/core/rake_task'
require 'bundler/gem_tasks'
require 'rubocop/rake_task'

CLOBBER.include('coverage')

Rubocop::RakeTask.new

task :console do
  Bundler.require(:development)
  require 'godville_kit'
  binding.pry
end

desc 'Run all specs'
RSpec::Core::RakeTask.new do |t|
  t.pattern = './spec/**/*spec.rb'
end

task default: :spec
