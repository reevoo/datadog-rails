# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'datadog/rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'datadog-rails'
  spec.version       = Datadog::Rails::VERSION
  spec.authors       = ['David Sevcik']
  spec.email         = ['david.sevcik@reevoo.com']
  spec.summary       = 'Rails app performance tracking for Datadog'
  spec.description   = 'Collects controller action metrics of Rails application and sends them to Datadog platform.'
  spec.homepage      = 'https://github.com/reevoo/datadog-rails'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  # spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  # spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11.2'
  spec.add_development_dependency 'rake', '~> 10.5.0'
  spec.add_development_dependency 'pry-byebug', '~> 3.3.0'

  spec.add_runtime_dependency 'dogstatsd-ruby', '~> 1.6.0'
  spec.add_runtime_dependency 'gem_config', '~> 0.3.1'
end
