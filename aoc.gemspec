
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "aoc/version"

Gem::Specification.new do |spec|
  spec.name          = "aoc"
  spec.version       = Aoc::VERSION
  spec.authors       = ["Jonathan Lalande"]
  spec.email         = ["lalandej.gg@gmail.com"]

  spec.summary       = %q{Advent of Code toolkit}
  spec.description   = %q{Advent of Code toolkit to fetch inputs and submit answers efficiently.}
  spec.homepage      = "https://github.com/zergov/aoc/"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["aoc"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0.2"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_dependency 'thor', '~> 0.19.1'
  spec.add_dependency 'nokogiri', '~> 1.6', '>= 1.6.8'
end
