class Person
  attr_accessor :skills, :age
  def initialize
    @age = 0
    @skills = {
      gathering: 1
    }
    @stats = {
      hunger: 0
    }
  end

  def gather
    $food += @skills[:gathering]
    @skills[:gathering] += 1
    
    time_passes
  end

  def time_passes
    @stats[:hunger] -= 1
    @age += 1
  end

  def task(input)
    case input.downcase.chars.first
    when 'g'
      gather
    else
      puts "unknown command"
    end
  end
end

$food = 2

$player = Person.new

def display
  puts "-" * 30
  puts "Food: #{$food}"
  puts "Player Age: #{$player.age}"
  puts "Gathering Skill: #{$player.skills[:gathering]}"
end

def play
  puts "Welcome to the game. You currently can only gather. "
  puts "Type G or 'gather' to do so."
  input = gets.chomp
  until input == 'stop'
    display
    $player.task(input)
    input = gets.chomp
  end
end

play