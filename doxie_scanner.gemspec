require File.expand_path('lib/doxie_scanner/version', File.dirname(__FILE__))

Gem::Specification.new do |s|
  s.name        = 'doxie_scanner'
  s.version     =  DoxieScanner::VERSION
  s.summary     = "A simple scanner for your Doxie Go Wifi"
  s.description = "A simple scanner for your Doxie Go Wifi"
  s.authors     = ["Cristiano Betta"]
  s.email       = 'cbetta@gmail.com'
  s.files       = Dir.glob('{lib,spec}/**/*') + %w(LICENSE README.md doxie_scanner.gemspec)
  s.homepage    = 'https://github.com/cbetta/doxie_scanner'
  s.license     = 'MIT'
  s.require_path = 'lib'

  s.add_development_dependency('frisky')
end
