lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'live_address/version'

Gem::Specification.new do |spec|
  spec.name          = "live_address"
  spec.version       = LiveAddress::VERSION
  spec.authors       = ["Daniel Berkompas"]
  spec.email         = ["daniel@leadsimple.com"]
  spec.description   = %q{Integration with SmartyStreet's LiveAddress API}
  spec.summary       = %q{Integration with SmartyStreet's LiveAddress API}

  spec.files         = Dir["lib/**/*.rb"]
  spec.test_files    = Dir["spec/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport'
  spec.add_dependency 'patron'
  spec.add_dependency 'hashie'
end
