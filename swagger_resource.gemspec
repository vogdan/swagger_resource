# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'swagger_resource'
  s.version     = '0.0.1'
  s.authors     = ["darius.roberts@gmail.com"]
  s.description = "builds RPC object by consuming swagger json"
  s.summary     = "#{s.name}-#{s.version}"
  s.email       = 'darius.roberts@gmail.com'
  s.homepage    = "http://dariusroberts.com"

  # Main development dependencies
  s.add_development_dependency('rake', '>= 0.9.2.2')
  s.add_development_dependency('rspec', '~> 2.10.0')

  # For Documentation:
  s.add_development_dependency('yard', '~> 0.8.5.2')
  s.add_development_dependency('rdoc', '~> 3.12.2')
  s.add_development_dependency('rdiscount', '~> 2.0.7')
  s.add_development_dependency('bcat', '~> 0.6.2')

  s.rubygems_version = ">= 1.6.1"
  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables      = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_path     = "lib"
end
