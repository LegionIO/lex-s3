require_relative 'lib/legion/extensions/s3/version'

Gem::Specification.new do |spec|
  spec.name          = 'lex-s3'
  spec.version       = Legion::Extensions::S3::VERSION
  spec.authors       = ['Esity']
  spec.email         = ['matthewdiverson@gmail.com']

  spec.summary       = 'LEX::S3'
  spec.description   = 'LEX::S3'
  spec.homepage      = 'https://bitbucket.org/legion-io/lex-s3'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://bitbucket.org/legion-io/lex-s3'
  spec.metadata['documentation_uri'] = 'https://legionio.atlassian.net/wiki/spaces/LEX/pages/'
  spec.metadata['changelog_uri'] = 'https://legionio.atlassian.net/wiki/spaces/LEX/pages/'
  spec.metadata['bug_tracker_uri'] = 'https://bitbucket.org/legion-io/lex-s3/issues'
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '>= 2'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
end
