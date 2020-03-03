require 'minitest/autorun'

class Rectangle

  attr_accessor :width, :height

  def area
    @width * @height
  end

  def perimeter
    (@width * 2) + (@height * 2)
  end

end

class TestRectangle < Minitest::Test
  def setup
    @rectangle = Rectangle.new
    @rectangle.width = 2
    @rectangle.height = 4
  end
  def test_area
    assert_equal(8, @rectangle.area,
      "Area should equal width * height")
  end

  def test_perimeter
    assert_equal(12, @rectangle.perimeter,
      "Perimeter should equal width * 2 + height * 2")
  end

end