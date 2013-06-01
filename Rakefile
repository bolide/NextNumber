require "bundler/gem_tasks"
require 'rake'
require 'rake/testtask'
begin
  require 'rake/rdoctask'
rescue
  require 'rdoc/task'
end
desc 'Default: run unit tests.'
desc 'Run: rake test'
task :default => :test

desc 'Test the framework plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the framework plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Framework'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
