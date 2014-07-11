# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack-devfavicon/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-devfavicon"
  spec.version       = Rack::DevFavicon::VERSION
  spec.authors       = ["Fuji, Goro"]
  spec.email         = ["gfuji@cpan.org"]
  spec.description   = %q{A rack middleware to show gray-scaled favicon on development}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/gfx/rack-devfavicon/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'rmagick'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
