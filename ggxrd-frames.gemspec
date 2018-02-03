# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ggxrd/frames/version'

Gem::Specification.new do |spec|
  spec.name          = "ggxrd-frames"
  spec.version       = GGXrd::Frames::VERSION
  spec.authors       = ["megane42"]
  spec.email         = ["h.kzm.gm@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  end

  spec.summary       = "Unofficial gem which scrapes GGXrd official frame data page"
  spec.description   = "This gem scrapes GGXrd official frame data page (http://www.4gamer.net/guide/ggxrd/) and gives you the result as a hash."
  spec.homepage      = "https://github.com/megane42/ggxrd-frames"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "mechanize", "~> 2.7"

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.8"
  spec.add_development_dependency "webmock", "~> 3.3"
end
