require './lib/aoc/version'

Gem::Specification.new do |s|
  s.name        = 'aoc'
  s.version     = ::Aoc::VERSION
  s.date        = '2018-12-03'
  s.summary     = "Advent of Code toolkit"
  s.description = "Toolkit to speed up and improve your Advent of Code submissions"
  s.authors     = ["Jonathan Lalande"]
  s.email       = 'lalandej.gg@gmail.com'
  s.files       = Dir["lib/**/*"]
  s.homepage    = 'http://rubygems.org/gems/aoc'
  s.license     = 'MIT'
end
