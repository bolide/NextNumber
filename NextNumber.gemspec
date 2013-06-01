# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'NextNumber/version'

Gem::Specification.new do |spec|
  spec.name          = "NextNumber"
  spec.version       = NextNumber::VERSION
  spec.authors       = "尜芈爨"
  spec.email         = "1244002@qq.com"
  spec.description   = %q{next number}
  spec.summary       = %q{order number}
  spec.homepage      = "http://www.huolg.com"
  spec.license       = "MIT"

  spec.files         = [   
    "Gemfile",   
    "Rakefile",
    "lib/NextNumber.rb",
    "lib/NextNumber/version.rb",
    "lib/NextNumber/standard_types.rb" 
  ]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
