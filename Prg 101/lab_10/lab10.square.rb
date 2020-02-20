class Rectangle
  attr_reader :width, :height
  def width=(value)
    if value.negative?
      raise "invalid width: #{value}"
    else
      @width = value
    end
  end
  def height=(value)
    if value.negative?
      raise "invalid height: #{value}"
    else
      @height = value
    end
  end
  def area
    @width * @height
  end
  def to_s
    "width: #{@width}, height: #{@height}"
  end
end

class Square < Rectangle
  def width=(value)
    super
    @height = value
  end
  def height=(value)
    super
    @width = value
  end
end

rect = Rectangle.new
rect.width = 100
rect.height = 10

puts rect

square = Square.new
square.width = 25

puts square