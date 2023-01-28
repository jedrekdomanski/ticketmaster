# frozen_string_literal: true

require_relative 'lib/ticketmaster/version'

Gem::Specification.new do |spec|
  spec.name = 'ticketmaster'
  spec.version = Ticketmaster::VERSION
  spec.authors = ['Jędrzej Domański']
  spec.email = ['jedrek.domanski@gmail.com']

  spec.summary = 'Ruby client to Ticketmaster REST API'
  spec.description = 'Ruby client to Ticketmaster REST API'
  # spec.homepage = 'TODO: Put your gem's website or public repo URL here.'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  # spec.metadata['homepage_uri'] = spec.homepage
  # spec.metadata['source_code_uri'] = 'TODO: Put your gem's public repo URL here.'
  # spec.metadata['changelog_uri'] = 'TODO: Put your gem's CHANGELOG.md URL here.'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split('\x0').reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec)/|\.(?:git|travis|circleci))})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'
  spec.add_dependency 'dry-schema', '~> 1.10'

  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'faraday', '~> 1.10'
  spec.add_development_dependency 'guard-rspec', '~> 4.7'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec', '~> 3.12'
end
