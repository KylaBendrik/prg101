# frozen_string_literal: true

def validate(num)
  arr = num.to_s.split('')
  num_arr = []
  arr.each do |digit|
    num_arr.push(digit.to_i)
  end

  last_digit = -1
  double_digit = -1
  double_done = false
  digits_right = true

  # check digits to = or >
  num_arr.each do |digit|
    digits_right = false if digit < last_digit
    last_digit = digit
  end

  #patterns: BBAAAA, ABBAAA, AABBAA, AAABBA, AAAABB
  #need to check pairs to see if a match is found, with the before and after being different.

  if num_arr[0] == num_arr[1] && num_arr[1] != num_arr[2]
    puts "#{num} fits AABBBB"
    double_done = true
  end
  (1..3).each do |index|
    if num_arr[index] == num_arr[index + 1] && num_arr[index+1] != num_arr[index+2] && num_arr[index] != num_arr[index-1]
      puts "#{num} fits BAABBB or BBAABB or BBBAAB"
      double_done = true
    end
  end
  if num_arr[4] == num_arr[5] && num_arr[4] != num_arr[3]
    puts "#{num} fits BBBBAA"
    double_done = true
  end

  double_done && digits_right
end

# puts validate(111_122)
# puts validate(123_444)

start_num = 245_182
end_num = 790_572

valid_numbers = []

(start_num..end_num).each do |number|
  if validate(number)
    valid_numbers.push(number)
  end
  # puts "Is #{number} valid? #{validate(number)} ~~ Valid_nums: #{valid_numbers.length}"

end
