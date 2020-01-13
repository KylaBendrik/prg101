class Die
  def initialize
    roll
  end
  def roll
    @number_showing = 1 + rand(6)
  end
  def to_s
    @number_showing.to_s
  end
  def cheat
    input = gets.to_i
    while input > 6 || input < 1
      
      puts "You're cheating too much. "
      puts "Please cheat responsibly with a number between 1 and 6, inclusively."
    
      input = gets.to_i
    end

    @number_showing = input
  end
end

die = Die.new
puts die
die.cheat