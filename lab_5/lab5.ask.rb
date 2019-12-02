# frozen_string_literal: true

# goal: do not use answer variable, have to use return
def ask
  QUESTIONS.map do |question|
    if question[0] == ''
      puts "Do you #{question[1]}?"
    else
      puts "Do you like #{question[0]} #{question[1]}?"
    end
    answer
  end
end

def answer
  reply = gets.chomp.downcase
  loop do
    if reply == 'yes'
      return true
    elsif reply == 'no'
      return false
    else
      puts 'Please answer "yes" or "no".'
      reply = gets.chomp.downcase
    end
  end
end

QUESTIONS = [
  %w[eating tacos],
  %w[eating burritos],
  ['', 'wet the bed'],
  %w[eating chimichangas],
  %w[eating sopapillas],
  %w[drinking horchata],
  %w[eating flautas]
].freeze

puts 'Hello, thanks for participating in the following survey!'

wet_bed = ask[2]

puts 'Thank you for participating!'

puts wet_bed
