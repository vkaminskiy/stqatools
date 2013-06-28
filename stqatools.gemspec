# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stqatools/version'

Gem::Specification.new do |gem|
  gem.name          = "stqatools"
  gem.version       = Stqatools::VERSION
  gem.authors       = ["Valentin Kaminskiy"]
  gem.email         = ["valentin.kaminskiy@rightscale.com"]
  gem.description   = %q{Write a gem description}
  gem.summary       = %q{Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib", "lib/stqatools"]

  #gem.add_dependency "thor", ">= :1.8.0"
end
