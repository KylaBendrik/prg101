# frozen_string_literal: true

NUMERALS = %w[M D C L X V I].freeze
VALUES = [1_000, 500, 100, 50, 10, 5, 1].freeze

def numeralize(num)
  result = ''
  VALUES.each_with_index do |val, index|
    next unless (num / val).positive?

    dividend = num / val
    num = num % val
    result += assign_numeral(dividend, index)
  end
  result
end

def assign_numeral(dividend, index)
  character = NUMERALS[index]
  result = character * dividend

  # if %w[I X C].include?(character) && dividend == 4
  #   result = character + NUMERALS[index - 1]
  # end

  result
end

print 'Enter some number: '
num = gets.to_i

puts "#{num} converts to #{numeralize(num)}"
