class Dragon
  def initialize(name)
    @name = name
    @asleep = false
    @stuff_in_belly = 10
    @stuff_in_intestine = 0

    puts "#{@name} is born."
  end

  def feed
    puts "You feed #{@name}"
    @stuff_in_belly = 10
    passage_of_time
  end

  def walk
    puts "You walk #{@name}"
    @stuff_in_intestine = 0
    passage_of_time
  end

  def put_to_bed
    puts "You put #{@name} to bed."
    @asleep = true

    3.times do
      if @asleep
        passage_of_time
      end
      if @asleep
        puts "#{@name} snores, filling the room with smoke."
      end
    end
    if @asleep
      @asleep = false
      puts "#{@name} wakes up slowly."
    end
  end

  def toss
    puts "You toss #{@name} up into the air."
    puts 'He giggles, which singes your eyebrows.'
    passage_of_time
  end

  def rock
    puts "You rock #{@name} gently"
    @asleep = true
    puts 'He briefly dozes off...'
    passage_of_time
    if @asleep
      @asleep = false
      puts '... but wakes when you stop.'
    end
  end

  def dispatch
    input = gets.chomp.downcase
    if input.include?('feed')
      feed
    elsif input.include?('walk')
      walk
    elsif input.include?('rock')
      rock
    elsif input.include?('toss')
      toss
    elsif input.include?('bed')
      put_to_bed
    else
      exit
    end
  end

  private

  def hungry?
    @stuff_in_belly <= 2
  end

  def poopy?
    @stuff_in_intestine >= 8
  end

  def passage_of_time
    if @stuff_in_belly > 0
      @stuff_in_belly     = @stuff_in_belly - 1
      @stuff_in_intestine = @stuff_in_intestine + 1
    else
      wakes_suddenly

      puts "#{@name} is starving! In desperation, he ate YOU!"
      exit
    end

    if @stuff_in_intestine >= 10
      @stuff_in_intestine = 0
      puts "Whoops! #{@name} had an accident..."
    end

    if hungry?
      wakes_suddenly
      puts "#{@name}'s stomach grumbles..."
    end

    if poopy?
      wakes_suddenly
      puts "#{@name} does the potty dance..."
    end
  end

  def wakes_suddenly
    if @asleep
      @asleep = false
      puts 'He wakes up suddenly!'
    end
  end
end



pet = Dragon.new('Bob')
while true
  pet.dispatch
end