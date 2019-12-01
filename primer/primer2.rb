class Simulation
  def initialize
    @blobs = []
  end
  def init_blobs(num_blobs, replication, death)
    num_blobs.times do
      @blobs.push Blob.new(replication, death)
    end
  end
  def tick(rep_rate, dea_rate)
    blobs_alive = living
    blobs_alive.each do |blob|
      blob.live_die

      if blob.alive?
        new_blob = blob.replicate
        if new_blob != "no blob"
          @blobs.push new_blob
        end
      end
    end
    display(rep_rate, dea_rate)
  end
  def display(rep_rate, dea_rate)
    line_width = 20

    stats = [
      ["Total Blobs:", "#{@blobs.length}"],
      ["Expected Delta:", "#{delta(rep_rate, dea_rate)}"]
    ]

    stats.each do |stat|
      puts stat[0].ljust(line_width) + stat[1].rjust(line_width)
    end
  end
  def living
    blobs_alive = []
    @blobs.each do |blob|
      if blob.alive?
        blobs_alive.push blob
      end
    end

  end
  def delta(rep_rate, dea_rate)
    # EXPECTED CHANGE = B + (R - D) * N
    result = ((rep_rate.to_f/100) - (dea_rate.to_f/100)) * living.length.to_f
    result.ceil(2)
  end
  
end

class Blob
  def initialize(replication, death)
    @replication_rate = replication
    @death_rate = death

    @alive = true
  end
  def replicate
    if rand(0..100) < @replication_rate
      Blob.new(@replication_rate, @death_rate)
    else
      "no blob"
    end
  end
  def alive?
    @alive
  end
  def live_die
    if rand(0..100) < @death_rate
      @alive = false
    end
  end

end

puts "How many blobs shall we start with?"

num_blobs = gets.to_i

sim = Simulation.new

print "Replication rate? (enter 0-100 or press ENTER for random number)"

rep_input = gets.chomp

if rep_input.empty?
  rep_input = rand(0..100)
  puts rep_input.to_s
else
  rep_input = rep_input.to_i
end


print "Death rate? (enter 0-100 or press ENTER for random number)"

dea_input = gets.chomp

if dea_input.empty?
  dea_input = rand(0..100)
  puts dea_input.to_s
else
  dea_input = dea_input.to_i
end

sim.init_blobs(num_blobs, rep_input, dea_input)

puts "Press Enter for new tick. Type in anything to stop program"

input = gets.chomp

while input.empty?
  sim.tick(rep_input, dea_input)

  input = gets.chomp
end