# frozen_string_literal: true

# student letter grades from A to F
# (space left for future implementation of + and - grades)
class Grade
  include Comparable
  attr_reader :letter

  LETTER_VALUES = { 'A' => 11, 'B' => 8, 'C' => 5, 'D' => 2, 'F' => 0 }.freeze

  def initialize(letter)
    @letter = letter
  end

  def letter=(input)
    unless LETTER_VALUES.keys.include?(input)
      raise "#{input} is not a valid grade letter"
    end

    @letter = value
  end

  def <=>(other)
    if LETTER_VALUES[letter] < LETTER_VALUES[other.letter]
      -1
    elsif LETTER_VALUES[letter] == LETTER_VALUES[other.letter]
      0
    else
      1
    end
  end
end

a_grade = Grade.new('A')
b_grade = Grade.new('B')
c_grade = Grade.new('C')
d_grade = Grade.new('D')
f_grade = Grade.new('F')

puts "a_grade > c_grade: #{ a_grade > c_grade }"
puts "f_grade < d_grade: #{ f_grade < d_grade }"
puts "b_grade > a_grade: #{ b_grade > a_grade }"
puts "a_grade == a_grade: #{ a_grade == a_grade }"
