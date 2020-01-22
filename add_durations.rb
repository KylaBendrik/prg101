class Duration
  attr_reader :minutes, :hours
  def initialize()
    print " - Please enter hours: "
    @hours = gets.to_i
    print " - Please enter minutes: "
    @minutes = gets.to_i

    puts " - #{@hours}:#{@minutes}"
  end
end

def display_total(total_minutes)
  hours = total_minutes / 60
  minutes = total_minutes % 60
  minutes_display = "#{minutes}"
  if minutes < 10
    minutes_display = "0#{minutes}"
  end
  return "total time: #{hours}:#{minutes_display}"
end

puts "Hello! Do you need help adding up durations? "
puts "How many entries?"

num_entries = gets.to_i
entries = []
total_time = 0

num_entries.times do
  entries.push(Duration.new)
end

entries.each do |duration|
  total_time = total_time + (duration.minutes + (duration.hours * 60))
end

puts display_total(total_time)