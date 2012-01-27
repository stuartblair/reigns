
# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "reigns/version"

Gem::Specification.new do |s|
  s.name                  = "reigns"
  s.version               = Reigns::VERSION
  s.authors               = ["Stuart Blair"]
  s.email                 = ["stuart@5values.com"]
  s.homepage              = "https://github.com/stuartblair/reigns"
  s.description           = %q{Provides JNDI/Servlet/Spring abstractions for use in Integration testing of J2EE services through JRuby}
  s.summary               = s.description
  s.rubyforge_project     = "reigns"
  s.files                 = `git ls-files`.split("\n")
  s.test_files            = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables           = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths         = ["lib"]
  s.required_ruby_version = ">= 1.9.2"
  s.platform              = "java"
 
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"
end
