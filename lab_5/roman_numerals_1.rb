puts "Enter an Arabic or Roman number"
input = gets.chomp

def roman_numeral(number)
  roman_numerals = [
  ["i", 1],
  ["v", 5],
  ["x", 10],
  ["l", 50],
  ["c", 100],
  ["d", 500],
  ["m", 1000]
]

array = []
current = number

  roman_numerals.reverse.each do |numeral|
    
    character = numeral[0]
    value = numeral[1]

    if current / value > 0
      puts "#{current} is greater than #{value}"
      dividend = current / value
      current = current % value
      puts "there are #{dividend} #{value}s in #{number}, with #{current} remaining"
      puts assign_numeral(dividend, character)

      array.push assign_numeral(dividend, character)
    end
  end

  array
end

def assign_numeral(dividend, character)
  result = character * dividend

  if result == "iiii"
    result = "iv"
  elsif result == "xxxx"
    result = "xl"
  elsif result == "cccc"
    result = "cd"
  end

  result
end

if input.match?(/\A[0-9]+\z/)
  puts "Arabic Number"

  number = input.to_i

  if number >= 6000
    puts "this is a large number, and won't render well." 
  end
  roman_array = roman_numeral(number)


  puts roman_array.join.upcase

elsif input.match?(/\A[IVXLCDMivxlcdm]+\z/)
  puts "Roman Numerals"

else
  puts "Oops, you put in something else."
end