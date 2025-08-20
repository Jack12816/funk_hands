# -*- encoding: utf-8 -*-

require File.expand_path('../lib/funk_hands/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'funk_hands'
  gem.version       = FunkHands::VERSION
  gem.author        = 'Gopal Patel'
  gem.email         = 'nixme@stillhope.com'
  gem.license       = 'MIT'
  gem.homepage      = 'https://github.com/Jack12816/funk_hands'
  gem.summary       = 'Exercise those fingers. Pry-based enhancements for the default Rails console.'
  gem.description   = "Spending hours in the rails console? Spruce it up and show off those hard-working hands! funk_hands replaces IRB with Pry, improves output through awesome_print, and has some other goodies up its sleeves."

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ['lib']

  gem.required_ruby_version = '>= 2.5'

  # Dependencies
  gem.add_runtime_dependency 'pry', '>= 0.15.0'
  gem.add_runtime_dependency 'pry-rails', '>= 0.3.11'
  gem.add_runtime_dependency 'pry-remote-reloaded', '~> 3.0'
  gem.add_runtime_dependency 'pry-byebug-reloaded', '~> 3.11'
end
