# frozen_string_literal: true

# ten speed settings
# can't operate when empty
# change speed only one unit at a time

# int getSpeed()
# void setSpeed(int x)
# boolean isFull()
# void fill()
# void empty()

require_relative './check_conditions'

class Blender
  attr_accessor :speed, :full
  def initialize
    @speed = 0
    @full = false
  end

  def getSpeed
    check(@speed, :int)
    @speed
  end

  def isFull
    check(@full, :bool)
    @full
  end

  def fill
    check(@full, false)
    @full = true
    check(@full, true)
  end

  def empty
    check(@full, true)
    check(@speed, 0)
    @full = false
    check(@full, false)
  end

  def setSpeed(num)
    check(num, :int)
    check(@full, true)
    if((num + 1) == @speed || (num - 1) == @speed) && num.positive? && num < 11
      @speed = num
    else
      raise "#{num} is more than one more or less than @speed: #{speed}"
    end
  end
end

def play
  blender = Blender.new
  input = " "

  while input != ""
    # display status
    puts "Speed: #{blender.getSpeed}"
    puts "Content Full: #{blender.isFull}"
    print "Enter int for new speed, 'f' to fill blender, or 'e' to empty blender: "
    input = gets.chomp

    if input.downcase == 'f'
      blender.fill
    elsif input.downcase == 'e'
      blender.empty
    else
      blender.setSpeed(input.to_i)
    end
  end
end

play
