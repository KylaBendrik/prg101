# frozen_string_literal: true

NUMERALS = {
  'M' => 1_000,
  'CM' => 900,
  'D' => 500,
  'CD' => 400,
  'C' => 100,
  'XC' => 90,
  'L' => 50,
  'XL' => 40,
  'X' => 10,
  'IX' => 9,
  'V' => 5,
  'IV' => 4,
  'I' => 1
}

def numberize(roman)
  result = 0
  pointer = 0
  invalid = %w[A B E F G H J K N O P Q R S T U W X Y Z 1 2 3 4 5 6 7 8 9 0]

  NUMERALS.each do |key, value|
    if invalid.include?(roman[pointer]) || invalid.include?(roman[pointer..pointer + 1])
      puts "invalid roman numberals!"
      exit
    end
    while roman[pointer] == key || roman[pointer..pointer + 1] == key
      invalid.push(key)
      result += value
      if key.length == 2
        pointer += 1
      end
      pointer += 1
    end
  end

  result
end

print 'Enter some roman numeral number: '
num = gets.chomp.upcase

puts "#{num} converts to #{numberize(num)}"