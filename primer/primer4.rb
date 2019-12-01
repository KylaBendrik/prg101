# frozen_string_literal: true

class Blob
  attr_accessor :alive, :age, :speed
  def initialize(_mutation_chance, speed)
    @age = 0
    @mutation_chance = 0
    @alive = true
    @speed = speed
  end

  def die
    @alive = false
  end

  def stats
    [@mutation_chance, @speed, @age]
  end

  def mutate(old_stats)
    new_stats = []
    old_stats.each do |stat|
      rand_num = rand
      next unless rand_num < @mutation_chance
      if rand > 0.5
        stat += rand_num
      else
        stat -= rand_num
      end
      new_stats.puch(stat)
    end

    new_stats
  end


  def have_baby(old_stats)
    stats = mutate(old_stats)
    Blob.new(stats[0], stats[1])
  end
end

class Game
  def initialize(food, num_blobs)
    @food = food
    @blobs = []

    num_blobs.times do
      @blobs.push(Blob.new(0.01, 0.7))
    end
  end

  def average_stat(stat_num)
    total = 0
    living_blobs.each do |blob|
      total += blob.stats[stat_num]
    end
    if living_blobs.length == 0
      0
    else
      total / living_blobs.length
    end
  end

  def display
    puts "Food: #{@food}"
    puts "Num Blobs: #{living_blobs.length}"
    puts "Average Speed: #{average_stat(1)}"
    puts "Average Age: #{average_stat(2)}"
  end

  def living_blobs
    array = []
    @blobs.each do |blob|
      array.push(blob) if blob.alive
    end
    array
  end

  def tick
    new_blobs = []
    living_blobs.each do |blob|
      # try to get two foods
      if rand < blob.speed && @food > 0

        blob.age += 1
        @food -= 1
        if rand < blob.speed && @food > 0
          @food -= 1
          new_blobs.push(blob.have_baby(blob.stats))
        end
      else
        blob.die
    end
    end
    new_blobs.each { |blob| @blobs.push(blob) }
    @food += 10
  end
end

game = Game.new(10, 2)

input = gets.chomp

while input.empty?
  game.display
  game.tick
  input = gets.chomp
end
