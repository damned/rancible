# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rancible/version'

Gem::Specification.new do |spec|
  spec.name          = "rancible"
  spec.version       = Rancible::VERSION
  spec.authors       = ["damned"]
  spec.email         = ["dan.moore@thoughtworks.com"]
  spec.summary       = %q{Ruby execution of Ansible commands}
  spec.description   = File.readlines('README.md').find {|l| l.start_with? 'Rancible'}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec", "~> 3"
  spec.add_development_dependency "rake", "> 9"
end
