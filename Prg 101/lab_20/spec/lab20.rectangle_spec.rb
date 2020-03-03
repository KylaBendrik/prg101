require 'spec_helper'

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

    it "should equal width * height" do
      expect(@rectangle.area).to eq 8
    end

    it "should equal width * 2 + height * 2" do
      expect(@rectangle.perimeter).to eq 12
    end
end