Gem::Specification.new do |s|
  s.name        = 'doxie-scanner'
  s.version     =  '1.2.0'
  s.summary     = "A simple scanner for your Wifi enabled Doxie scanner"
  s.description = "A simple scanner for your Wifi enabled Doxie scanner"
  s.authors     = ["Cristiano Betta"]
  s.email       = 'cristiano@betta.io'
  s.files       = Dir.glob('{lib,spec}/**/*') + %w(LICENSE README.md doxie-scanner.gemspec)
  s.homepage    = 'https://github.com/cbetta/doxie-scanner'
  s.license     = 'MIT'
  s.require_path = 'lib'

  s.add_dependency('frisky')

  s.add_development_dependency('rake')
  s.add_development_dependency('minitest')
end
