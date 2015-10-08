# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bosh/versions/version'
bosh_version = '1.3098.0'

Gem::Specification.new do |spec|
  spec.name          = 'bosh-versions'
  spec.version       = Bosh::Versions::VERSION
  spec.authors       = ['Alexander Lomov']
  spec.email         = ["alexander.lomov@altoros.com"]
  spec.description   = %q{Allows to see versions of BOSH releases and bosh-core gem.}
  spec.summary       = %q{Allows to check versions of BOSH releases and bosh-core gem.}
  spec.homepage      = 'https://github.com/Altoros/bosh-versions'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_runtime_dependency 'bosh_cli',  ">= #{bosh_version}"
  spec.add_runtime_dependency 'bosh_common',  ">= #{bosh_version}"
  spec.add_runtime_dependency 'membrane', '~> 1.1.0'
  spec.add_runtime_dependency 'rest-client', '~> 1.8.0'
  spec.add_runtime_dependency 'rubygems_api', '~> 1.0.1'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rspec', '~> 3.3.0'
  spec.add_development_dependency 'rspec-its', '~> 1.2.0'
  spec.add_development_dependency 'rake', '~> 10.4.2'
  spec.add_development_dependency 'rubocop', '~> 0.34.2'
end
