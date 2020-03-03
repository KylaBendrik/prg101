require 'minitest/autorun'
require 'lab20.testAssertions'

class TestMath < Minitest::Test
  def test_addition
    assert(2 + 2 == 4)
  end

  def test_multiplication
    assert(3 * 4 == 12)
  end
end