require 'rubygems'
require 'rake'

begin
  require 'jeweler'

  Jeweler::Tasks.new do |gem|
    gem.name = "freshbooks-rb-legacy"
    gem.summary = "Freshbooks Legacy Ruby Wrapper"
    gem.description = "Legacy FreshBooks API wrapper module"
    gem.email = "tech@twg.ca"
    gem.homepage = "http://github.com/twg/freshbooks-rb-legacy"
    gem.authors = [ "ben@outright.com" ]

    gem.add_development_dependency "mocha", ">= 0.9.4"

    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end

  Jeweler::GemcutterTasks.new

rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task test: :check_dependencies

task default: :test
