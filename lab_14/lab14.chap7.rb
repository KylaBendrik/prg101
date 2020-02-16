# frozen_string_literal: true

lines = []
File.open('votes.txt') do |file|
  lines = file.readlines
end

puts lines

votes = Hash.new(0)

lines.each do |line|
  name = line.chomp.upcase!
  votes[name] += 1
end

pp votes
