# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','the_dude-web','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'the_dude-web'
  s.version = TheDude::Web::VERSION
  s.author = 'Adam Phillips'
  s.email = 'adam@29ways.co.uk'
  s.homepage = 'http://github.com/adamphillips/the_dude-web'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Powers up The Dude with Capybara integration'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths << 'lib'
  s.bindir = 'bin'
  s.add_development_dependency('rake')
  s.add_runtime_dependency('capybara')
  s.add_runtime_dependency('selenium-webdriver')
  s.add_runtime_dependency('json', '~> 1.7.7')
end
