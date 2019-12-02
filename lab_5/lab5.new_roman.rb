# frozen_string_literal: true

NUMERALS = %w[M CM D CD C XC L XL X IX V IV I].freeze
VALUES = [1_000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1].freeze

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
  numeral = character * dividend

  numeral
end

print 'Enter some number: '
num = gets.to_i

puts "#{num} converts to #{numeralize(num)}"
