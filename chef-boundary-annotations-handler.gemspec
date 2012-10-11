# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
#require 'chef-boundary-annotations-handler/version'

Gem::Specification.new do |gem|
  gem.name          = "chef-boundary-annotations-handler"
  gem.version       = "0.1.1"
  gem.authors       = ["Joe Williams"]
  gem.email         = ["j@boundary.com"]
  gem.description   = %q{Chef Handler that creates Boundary Annotations from Chef Exceptions}
  gem.summary       = %q{Create Boundary Annotations from Chef Exceptions}
  gem.homepage      = "http://github.com/boundary/chef-boundary-annotations-handler"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
