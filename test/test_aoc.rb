require 'minitest/autorun'
require 'aoc'

class AocTest < Minitest::Test
  def test_aoc_has_version
    refute_nil ::Aoc::VERSION
  end
end
