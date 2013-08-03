# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'webpay/scaffold/version'

Gem::Specification.new do |spec|
  spec.name          = "webpay-scaffold"
  spec.version       = Webpay::Scaffold::VERSION
  spec.authors       = ["shu0115"]
  spec.email         = ["s.matsumoto0115@gmail.com"]
  spec.description   = %q{Scaffold for WebPay.}
  spec.summary       = %q{WebPay Scaffold}
  spec.homepage      = "https://github.com/shu0115/webpay-scaffold"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "webpay"
  spec.add_dependency "rails_config"
end
