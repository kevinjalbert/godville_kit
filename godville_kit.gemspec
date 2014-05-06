# -*- encoding: utf-8 -*-
$:.unshift File.expand_path("../lib", __FILE__)
require 'godville_kit/version'

Gem::Specification.new do |gem|
  gem.homepage      = 'https://github.com/kevinjalbert/godville_kit'
  gem.authors       = ["Kevin Jalbert"]
  gem.email         = ["kevin.j.jalbert@gmail.com"]
  gem.name          = 'godville_kit'
  gem.version       = GodvilleKit::VERSION
  gem.summary       = "A gem kit to instantiate your hero's state from Godville"
  gem.description   = "A gem kit to instantiate your hero's state from Godville"
  gem.require_paths = ["lib"]
  gem.files         = Dir['lib/**/*']
  gem.test_files    = Dir['spec/**/*_spec.rb']
  gem.required_ruby_version = '>= 1.9.3'
end
