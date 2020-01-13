def repeater(block)
  hours = Time.new.hour % 12
  hours.times do
    block.call
  end
end

chime = Proc.new do 
  puts 'CLONG'
end

repeater(chime)