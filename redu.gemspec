# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redu/version'

Gem::Specification.new do |gem|
  gem.name          = "redu"
  gem.version       = Redu::VERSION
  gem.authors       = ["Guilherme Cavalcanti"]
  gem.email         = ["guiocavalcanti@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'rake'
  if RUBY_VERSION < "1.9"
    gem.add_development_dependency "ruby-debug"
  else
    gem.add_development_dependency "debugger"
  end

  gem.add_runtime_dependency 'faraday', '~> 0.8.4'
  gem.add_runtime_dependency 'faraday_middleware', '~> 0.9.0'
  gem.add_runtime_dependency 'oauth2', '~> 0.8.0'
  gem.add_runtime_dependency 'json', '~> 1.7.6'
  gem.add_runtime_dependency 'configurable', '~> 1.0.0'
end
