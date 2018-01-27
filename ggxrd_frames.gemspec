# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ggxrd_frames/version'

Gem::Specification.new do |spec|
  spec.name          = "ggxrd_frames"
  spec.version       = GgxrdFrames::VERSION
  spec.authors       = ["megane42"]
  spec.email         = ["h.kzm.gm@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = "Unofficial gem which gets GGXrd frame data from official site"
  spec.description   = "This gem fetches GGXrd frame data from official site (http://www.4gamer.net/guide/ggxrd/) and gives you as hash."
  spec.homepage      = "https://github.com/megane42/ggxrd_frames"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
