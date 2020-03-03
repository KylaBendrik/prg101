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

describe Rectangle do
  before do
    @rectangle = Rectangle.new
    @rectangle.width = 2
    @rectangle.height = 4
  end

  describe "area" do
    it "should equal width * height" do
      @rectangle.area.must_equal 8
    end
  end

  describe "perimeter" do
    it "should equal width * 2 + height * 2" do
      @rectangle.perimeter.must_equal 12
    end
  end
end
