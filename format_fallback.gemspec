# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "format_fallback/version"

Gem::Specification.new do |s|
  s.name        = "format_fallback"
  s.version     = FormatFallback::VERSION
  s.authors     = ["Rob Cameron"]
  s.email       = ["cannikinn@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Tells Rails 3 to try and fallback to :html if the given format's template is not found}
  s.description = %q{When you're developing something like a mobile site and you're creating new views you may not always have a mobile version of your view available. This gem will tell Rails to attempt to load the standard HTML template if your special format isn't available.}

  s.rubyforge_project = "format_fallback"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
