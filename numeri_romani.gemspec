# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'numeri_romani/version'

Gem::Specification.new do |spec|
  spec.name          = "numeri_romani"
  spec.version       = NumeriRomani::VERSION
  spec.authors       = ["Vasiliy Petrov"]
  spec.email         = ["saugardas@yandex.ru"]

  spec.summary       = %q{Conversion between Decimals and Roman numbers in interval (1/12)-3_999_999(11/12)}
  spec.description   = %q{Conversion between Decimals and Roman Numbers in interval (1/12)-3_999_999(11/12)}
  spec.homepage      = "https://github.com/saugardas/numeri_romani"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.metadata = {
    'changelog_uri' => 'https://github.com/Saugardas/numeri_romani/blob/master/CHANGELOG.md'
  }

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.required_ruby_version = '>= 2.4.0'
end
