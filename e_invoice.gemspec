# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "e_invoice/version"

Gem::Specification.new do |spec|
  spec.name          = "e_invoice"
  spec.version       = EInvoice::VERSION
  spec.authors       = ["JasonYCHuang, Lucas Yang(tilumi)"]
  spec.email         = ["jasonych99@gmail.com, tilumi0@gmail.com"]

  spec.summary       = %q{Import electronic invoice from E-invoice platform, Ministry of Finance, Taiwan.}
  spec.description   = %q{With valid EASYCARD number and encrypt code, a user can get e-invoice data.}
  spec.homepage      = "https://github.com/JasonYCHuang/e_invoice"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  # Coveralls with SimpleCov
  spec.add_development_dependency "simplecov", "~> 0.8"
  spec.add_development_dependency "coveralls", "~> 0.7"
end
