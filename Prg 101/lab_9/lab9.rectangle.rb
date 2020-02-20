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
end

rect = Rectangle.new
rect.width = 100
rect.width = -10