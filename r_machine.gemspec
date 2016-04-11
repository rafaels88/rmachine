lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'r_machine/version'

Gem::Specification.new do |s|
  s.name          = 'r_machine'
  s.version       = RMachine::VERSION
  s.date          = '2016-04-11'
  s.summary       = "RMachine"
  s.description   = "A simple state machine library"
  s.authors       = ["Rafael Soares"]
  s.email         = 'rafaeltravel88@gmail.common'
  s.files         = `git ls-files -z`.split("\x0")
  s.require_paths = ["lib"]
  s.test_files    = s.files.grep(%r{^(spec)/})
  s.homepage      =
    'http://rubygems.org/gems/r_machine'
  s.license       = 'MIT'
end
