#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end
begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Isolation'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end



Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end


task :default => 'test:isolated'
# task :default => :test
# task :test => 'test:isolated'

## This is required until the regular test task
## below passes.  It's not ideal, but at least
## we can see the failures
namespace :test do
  task :isolated do
    dir = ENV["TEST_DIR"] || "**"
    Dir["test/#{dir}/*_test.rb"].each do |file|
      next true if file.include?("fixtures")
      dash_i = [
        'test',
        'lib',
        # "#{File.dirname(__FILE__)}/../activesupport/lib",
        # "#{File.dirname(__FILE__)}/../actionpack/lib"
      ]
      ruby "-I#{dash_i.join ':'}", file
    end
  end
end
