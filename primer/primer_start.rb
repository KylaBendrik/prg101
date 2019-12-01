# frozen_string_literal: true

class Simulation
  def initialize(num_blobs)
    @blobs = []

    init_blobs(num_blobs)
  end

  def init_blobs(num_blobs)
    num_blobs.times do
      @blobs.push Blob.new
    end
  end

  def tick
    display
  end

  def display
    line_width = 20

    stats = [
      ['Total Blobs:', @blobs.length.to_s]
    ]

    stats.each do |stat|
      puts stat[0].ljust(line_width) + stat[1].rjust(line_width)
    end
  end
end

class Blob
  def initialize; end
end

puts 'How many blobs shall we start with?'

num_blobs = gets.to_i

sim = Simulation.new(num_blobs)

puts 'Press Enter for new tick. Type in anything to stop program'

input = gets.chomp

while input.empty?
  sim.tick

  input = gets.chomp
end
