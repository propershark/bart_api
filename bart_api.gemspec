require_relative 'lib/bart_api/version'

Gem::Specification.new do |spec|
  spec.platform       = Gem::Platform::RUBY
  spec.name           = 'bart_api'
  spec.authors        = [ 'Elliott Williams' ]
  spec.email          = 'code@elliottwillia.ms'
  spec.homepage       = 'http://github.com/propershark/bart_api'
  spec.summary        = 'A Ruby client for the BART real-time transit API.'
  spec.description    = 'A Ruby client for the BART real-time transit API.'
  spec.license        = 'MIT'
  spec.version        = bart::VERSION.dup
  spec.required_ruby_version = '>= 2.2.0'

  spec.files             = Dir['lib/**/*']
  spec.require_paths     = %w[ lib ]
  spec.extra_rdoc_files  = ['LICENSE']

  spec.add_dependency 'memoist',  '~> 0.14'
  spec.add_dependence 'nokogiri', '~> 1.8'
end

