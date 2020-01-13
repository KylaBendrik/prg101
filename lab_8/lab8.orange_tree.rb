class Orange_Tree
  attr_accessor :age
  def initialize
    @age = 0
    @oranges = 0
    @height = 0.0
    @health = 100
  end

  def one_year_passes
    @age += 1
    check_health
    grow_height
    grow_oranges
    
    puts "-" * 30
    puts "Your tree is now #{@age} years old, and #{pretty_height} tall!"
    puts "Your tree produces #{pretty_count} oranges this year."
  end

  def pretty_height
    feet = @height / 12
    inches = @height % 12
    feet_display = ''
    in_display = ''

    if feet > 0
      feet_display = "#{feet} ft "
    end
    if inches > 0
      in_display = "#{inches} in"
    end

    return "#{feet_display}#{in_display}"
  end

  def grow_height
    if @height < 420
      amount = rand(0..(200 / (@age * (101 - @health))))
      @height = (@height + amount).to_i
    end
  end

  def grow_oranges
    max = 0
    min = 0
    max = 0.14 * (@age * @health) unless @age < 2
    if max > 400
      max = 400
    end
    min = 2 * @health unless max < 200
    @oranges = rand(min.to_i..max.to_i)
  end

  def check_health
    sicker = rand(0..@age)
    better = 100 - rand(@age..100)

    difference = better - sicker

    @health += difference

    if @health > 100
      @health = 100
    end

    if @health <= 0
      puts "Your tree died."
      exit
    end
  end

  def pretty_count
    if @oranges == 0
      "no"
    else
      @oranges.to_s
    end
  end

  def pick_orange
    unless @oranges == 0
      @oranges = @oranges - 1
      print "You pick an orange. "
      if @health == 100
        puts "It's the most delicious orange you've ever had!"
      elsif @health < 100 && @health >= 90
        puts "It's quite good!"
      elsif @health < 90 && @health >= 50
        puts "It's decent. You've had better, you've had worse..."
      elsif @health < 50 && @health >= 20
        puts "It's quite dry and bland. Definitely had better..."
      else 
        puts "It's hard to swallow. Not good at all."
      end

      puts "There's now #{pretty_count} left on the tree."

      input = gets.chomp
      if input.chomp.downcase.include?('pick')
        pick_orange
      end
    else
      puts "There's no more oranges on the tree. Try again next year."
    end
  end

  
end

puts "You own a spot of ground, and an orange seed. "
puts "Press enter to plant the seed!"

input = gets.chomp

tree = Orange_Tree.new

puts "-"*30
puts "You now have an orange tree sapling."

while input.empty?
  input = gets.chomp
  if input.downcase.include?('pick') && tree.age > 1
    tree.pick_orange
    input = ''
  end
  tree.one_year_passes
end