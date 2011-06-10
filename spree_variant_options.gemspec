# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "spree_variant_options/version"

Gem::Specification.new do |s|
  s.name        = "spree_variant_options"
  s.version     = SpreeVariantOptions::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Spencer Steffen"]
  s.email       = ["spencer@citrusme.com"]
  s.homepage    = "https://github.com/citrus/spree_variant_options"
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "spree_variant_options"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  # Spree
  s.add_dependency('spree_core', '>= 0.60.0')
  
  # Development
  s.add_development_dependency('spree_sample',     '>= 0.60.0')
  s.add_development_dependency('dummier',          '>= 0.1.1')
  s.add_development_dependency('shoulda',          '>= 2.11.3')
  s.add_development_dependency('spork',            '>= 0.9.0.rc8')
  s.add_development_dependency('spork-testunit',   '>= 0.0.5')
  s.add_development_dependency('factory_girl',     '>= 2.0.0.beta2')
	s.add_development_dependency('cucumber-rails',   '>= 0.4.1')
	s.add_development_dependency('database_cleaner', '>= 0.6.7')
	s.add_development_dependency('capybara',         '>= 0.4.1')
  s.add_development_dependency('sqlite3',          '>= 1.3.3')

end