# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hatchet/version'

Gem::Specification.new do |gem|
  gem.name          = "heroku_hatchet"
  gem.version       = Hatchet::VERSION
  gem.authors       = ["Richard Schneeman"]
  gem.email         = ["richard.schneeman+rubygems@gmail.com"]
  gem.description   = %q{Hatchet is a an integration testing library for developing Heroku buildpacks.}
  gem.summary       = %q{Hatchet is a an integration testing library for developing Heroku buildpacks.}
  gem.homepage      = "https://github.com/heroku/hatchet"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "platform-api",  "~> 2"
  gem.add_dependency "rrrretry",      "~> 1"
  gem.add_dependency "excon",         "~> 0"
  gem.add_dependency "thor",          "~> 0"
  gem.add_dependency "repl_runner",   "~> 0.0.3"
  gem.add_dependency "threaded",      "~> 0"
  gem.add_dependency 'minitest-retry', '~> 0.1.9'

  gem.add_development_dependency "minitest",       "~> 5.1"
  gem.add_development_dependency "rake",           "~> 10"
  gem.add_development_dependency "mocha",          "~> 1"
  gem.add_development_dependency "parallel_tests", "~> 2"
  gem.add_development_dependency "travis",         "~> 1"
end
