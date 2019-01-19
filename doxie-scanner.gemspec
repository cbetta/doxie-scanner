Gem::Specification.new do |s|
  s.name        = 'doxie-scanner'
  s.version     =  '1.0.0'
  s.summary     = "A simple scanner for your Doxie Go Wifi"
  s.description = "A simple scanner for your Doxie Go Wifi"
  s.authors     = ["Cristiano Betta"]
  s.email       = 'cbetta@gmail.com'
  s.files       = Dir.glob('{lib,spec}/**/*') + %w(LICENSE README.md doxie-scanner.gemspec)
  s.homepage    = 'https://github.com/cbetta/doxie-scanner'
  s.license     = 'MIT'
  s.require_path = 'lib'

  s.add_dependency('frisky')

  s.add_development_dependency('rake')
  s.add_development_dependency('minitest')
end
