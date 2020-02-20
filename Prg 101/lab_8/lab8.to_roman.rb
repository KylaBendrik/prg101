class Integer
  NUMERALS = %w[M D C L X V I].freeze
  VALUES = [1_000, 500, 100, 50, 10, 5, 1]
  def to_roman
    numeralize(self)
  end
  def numeralize(num)
    result = ''
    VALUES.each_with_index do |val, index|
      next unless (num / val).positive?

        dividend = num / val
        num = num % val
        result += assign_numeral(dividend, index)
      
    result = simplify(result)

    
    end
    result
  end 

  def assign_numeral(dividend, index)
    character = NUMERALS[index]
    numeral = character * dividend
  
    numeral
  end
  
  def simplify(string)
    # 99: should be 'XCIX', by default is 'LXXXXVIIII'
    array = string.split('')
    new_array = []
    array.each_with_index do |numeral, index|
      if numeral == array[index + 1] && numeral == array[index + 2] && numeral == array[index + 3]
        # we are dealing with a four. Are we dealing with a nine?
        new_array.push("yay")
      else
        new_array.push(numeral)
      end
    end
    new_array.join
  end
end

print 'Enter some number: '
num = gets.to_i

puts "#{num} converts to #{num.to_roman}"