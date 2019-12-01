# frozen_string_literal: true

class Car
  attr_accessor :max_acceleration, :max_speed, :current_speed, :location
  def initialize(max_acc)
    @max_acceleration = max_acc
    @max_speed = 3
    @current_speed = 0
    @location = 0
  end

  def move
    @current_speed += @max_acceleration if @current_speed < @max_speed
    @location += @current_speed
  end
end

class Track
  attr_accessor :car
  def initialize
    @length = 25
    @car = Car.new(1)
  end

  def display_game
    display_height = 11
    display_width = (@length * 2) + 20
    line = 0

    puts "\e[;H"
    # puts '-' * display_width
    (display_height - 2).times do
      track_display = display_track(line, display_height - 2, display_width - 2)
      puts "|#{line}".ljust((display_width - track_display.length) / 2) + track_display + '|'.rjust((display_width - track_display.length) / 2)
      line += 1
    end
    puts '-' * display_width

    # display track
  end

  def display_track(line, map_height, _map_width)
    track = ''
    location = 0
    if line == map_height / 2
      @length.times do
        track += display_location(location) + '|'
        location += 1
      end
    end
    track
  end

  def display_location(location)
    display = ''
    display = if @car.location == location
                'O'
              else
                '_'
              end
    display
  end

  def play
    car.move
  end
end

track = Track.new

puts 'Welcome to the racing simulator! Press enter to watch.'

input = gets.chomp

while input.empty?
  track.display_game
  input = gets.chomp
  track.play
end