class Game
  attr_accessor :nodes, :food_inv, :peeps
  def initialize
    puts "new game initializing"
    @nodes = [1]
    @peeps = []
    @food_inv = 10
  end

  def peep_count
    living = @peeps.select do |peep|
      peep.alive
    end

    living.length
  end

  def new_peep
    @peeps.push Peep.new(peeps.length)
  end

  def end_day
    
    living = @peeps.select do |peep|
      peep.alive
    end

    puts living


    living.each { |peep|
      food = peep.end_day("i")

      if @food_inv >= food
        @food_inv -= food
      else
        peep.alive = false
      end
    }


  end
end

class Peep
  attr_accessor :id, :age, :alive
  def initialize(id_num)
    @id = id_num
    @assigned = false
    @age = 0
    @alive = true
  end

  def idle
    puts "idle"
    0
  end

  def gather
    puts "gather"
    2
  end


  def end_day(task)
    @age += 1

    case task
      when ?i
        extra_food = idle
      when ?g
        extra_food =  -70 90 -71/tp KylaBendrik gather
    end

    1 + extra_food
  end
end

game1 = Game.new
game1.new_peep

puts "Press 'ENTER' to start new day. Type 'STOP' to quit game."

input = gets.chomp

while input.empty?
  puts "Food: #{game1.food_inv}, Peeps: #{game1.peep_count}"

  game1.end_day

  input = gets.chomp
end
