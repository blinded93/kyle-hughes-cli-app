# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'local_library/version'

Gem::Specification.new do |spec|
  spec.name          = "local_library"
  spec.version       = LocalLibrary::VERSION
  spec.authors       = ["'Kyle Hughes'"]
  spec.email         = ["'blinded93@gmail.com'"]

  spec.summary       = "Enter a zip code and get a list of nearby libraries and contact/location details."
  spec.homepage      = "https://github.com/blinded93/kyle-hughes-cli-app"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "rspec"
end
