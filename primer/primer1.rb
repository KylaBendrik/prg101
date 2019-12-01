#in these simulations, I will be attempting to follow along with Primer's "Evolution" simulations, 
#recreating each one he does, but in text instead of visually.

#Video 1, around 2:13

class Blob
  attr_accessor :alive
  def initialize(birth_chance, death_chance)
    @birth_chance = birth_chance
    @death_chance = death_chance
    @alive = true
  end
  def tick
    if rand(0..100) < @death_chance
      die
    end
  end
  def die
    @alive = false
  end
end

class History
  attr_accessor :num_blobs, :average_blobs
  def initialize(blobs, average)
    @num_blobs = blobs
    @average_blobs = average
  end
end

class Sim
  attr_accessor :birth_chance, :death_chance, :history, :blobs
  def initialize(birth_chance, death_chance)
        
    @birth_chance = birth_chance
    @death_chance = death_chance
    @history = []
    @blobs = []

  end
  def tick
    puts "new tick"
    display_stats
  
    if rand(1..100) < @birth_chance
      @blobs.push Blob.new(@birth_chance, @death_chance)
    end
    @blobs.each {|blob| blob.tick}

    enter_history

  end
  def enter_history
    @history.push History.new(num_blobs, average_blobs)
  end
  def num_blobs
    num = 0
    @blobs.each do |blob| 
      if blob.alive
        num += 1 
      end
    end
    num
  end
  def average_blobs
    total = 0
    @history.each do |event|
      total += event.num_blobs
    end

    if @history.length == 0
      0
    else
      total/@history.length
    end
  end
  def display_stats
    puts "- -" * 20
    puts "ticks: #{@history.length}"
    puts "total blobs: #{num_blobs}"
    puts "Average blobs: #{average_blobs}"
    puts "Birth chance: #{@birth_chance}"
    puts "Death chance: #{@death_chance}"
    puts "Expected Equillibrium: #{@birth_chance / @death_chance}"
  end
end


  
puts "Commands:"
puts "ENTER - next tick"
# puts "### - number of ticks"
# puts "stop - stop simulation"

sim1 = Sim.new(80, 2)

input = gets.chomp

while input.empty?
  sim1.tick
  input = gets.chomp
end
