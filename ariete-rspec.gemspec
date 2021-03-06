lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ariete/rspec/version'

Gem::Specification.new do |spec|
  spec.name          = "ariete-rspec"
  spec.version       = Ariete::Rspec::VERSION
  spec.authors       = ["Moza USANE"]
  spec.email         = ["mozamimy@quellencode.org"]

  spec.summary       = %q{An extension of Ariete for RSpec.}
  spec.description   = %q{An extension of Ariete for RSpec.}
  spec.homepage      = "https://github.com/mozamimy/ariete-rspec"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "rspec", "~> 3.0"
  spec.add_dependency "ariete", "~> 1.0.3"
end
