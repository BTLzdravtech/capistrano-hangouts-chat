# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/hangouts-chat/version'

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-hangouts-chat'
  spec.version       = Capistrano::HangoutsChat::VERSION
  spec.authors       = ['Tomas Hruska']
  spec.email         = ['hruska@btl.cz']
  spec.summary       = 'Hangouts Chat integration for Capistrano 3'
  spec.description   = 'Send Capistrano deployment notificatons to Hangouts Chat'
  spec.homepage      = 'https://github.com/BTLzdravtech/capistrano-hangouts-chat'

  spec.files         = `git ls-files -z`.split('\x0')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '~> 3.0'
  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
