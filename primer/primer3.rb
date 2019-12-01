# frozen_string_literal: true

# This version doesn't quite match Primer's third video
# In his version, the original blobs mutate into specific other "species" of blobs
# Mine individually mutates each stat.

class Simulation
  def initialize(num_blobs, stats)
    @blobs = []

    init_blobs(num_blobs, stats)
  end

  def init_blobs(num_blobs, stats)
    num_blobs.times do
      @blobs.push Blob.new(stats)
    end
  end

  def tick
    blobs_alive.each do |blob|
      blob.live_die
      # print blob.stats
      # puts ""

      if blob.alive? && blob.replicate?
        @blobs.push Blob.new(blob.new_stats(blob.stats))
      end
    end
    display
  end

  def average_stat(stat_num)
    average = 0
    blobs_alive.each do |blob|
      average += blob.stats[stat_num]
    end
    average /= blobs_alive.length
  end

  def display
    line_width = 30

    stats = [
      ['Total Blobs:', blobs_alive.length.to_s],
      ['Average Death Rate', average_stat(0).ceil(3).to_s],
      ['Average Replication Rate', average_stat(1).ceil(3).to_s],
      ['Average Mutation Rate', average_stat(2).ceil(3).to_s]
    ]

    stats.each do |stat|
      puts stat[0].ljust(line_width) + stat[1].rjust(line_width)
    end
  end

  def blobs_alive
    alive = []
    @blobs.each do |blob|
      alive.push blob if blob.alive?
    end
    alive
  end
end

class Blob
  def initialize(stats)
    @death_rate = stats[0]
    @repli_rate = stats[1]
    @mutat_rate = stats[2]

    @alive = true
  end

  def alive?
    @alive
  end

  def live_die
    @alive = false if rand < @death_rate
  end

  def replicate?
    rand < @repli_rate
  end

  def stats
    [@death_rate,
     @repli_rate,
     @mutat_rate]
  end

  def mutate?(num)
    num < @mutat_rate
  end

  def new_stats(parent_stats)
    new_stats = []
    parent_stats.each do |stat|
      mut_amount = rand

      if mutate?(mut_amount)
        'mutation'
        # plus or minus?
        if rand > 0.5
          new_stats.push (stat + mut_amount)
        else
          new_stats.push (stat - mut_amount)
        end
      else
        new_stats.push stat
      end
    end
    new_stats
  end
end

puts 'How many blobs shall we start with?'

num_blobs = gets.to_i

puts 'Press enter to start with basic stats (D, R, M):'
# death rate, replicaction rate, mutation rate
stats = [rand, rand, rand]

puts stats

gets.chomp

sim = Simulation.new(num_blobs, stats)

puts 'Press Enter for new tick. Type in anything to stop program'

input = gets.chomp

while input.empty?
  sim.tick

  input = gets.chomp
end
