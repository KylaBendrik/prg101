# frozen_string_literal: true

require 'date'

# goals: end up with a generated file containing
# a list of all the members of the colony menbers ever.
# able to visually represent family trees (ancestor or decendent)
# keep people simple. Name, birthday, death day, married day.
class Person
  attr_accessor :id
  def initialize
    @id = $colony.length
    @female = rand(1..2) == 1
    @birth_day = $today
    @death_day = nil
    @marriage = {
      spouse: nil
    }
  end

  def to_s
    death_display = ''

    death_display = if @death_day.nil?
                      '?'
                    else
                      @death_day.to_s
                    end
    gen_display = if @female
                    '(female)'
                  else
                    '(male)'
    end

    "#{@birth_day} - #{@death_display} #{gen_display}"
  end

  def alive?
    $today > @birth_day && $today < @death_day
  end

  def married?
    @marriage.spouse.nil?
  end

  def age
    $today.year - @birthday.year
  end

  def new_day
    if alive?
      # marry if eligible && unmarried
      if married? && age > 17
        # find partner
        potentials = []
        $colony.each do |person|
          next if person.married?
          next unless person.age > 17

          potentials.push(person) if person.age > 17
        end

        unless potentials.empty?
          new_spouse = potentials.sample
          @marriage[:spouse] = new_spouse.id
          @marriage[:date] = $today
          new_spouse.marriage[:spouse] = @id
          new_spouse.marriage[:date] = $today
        end

      end
    end
  end
end

$today = Date.new(1, 1, 1)
$colony = []
4.times do
  $colony.push(Person.new)
end

$today = Date.new(20, 1, 1)

def display
  $colony.each do |person|
    puts person
  end
end

input = gets.chomp

while input.empty?
  jump = 10
  $today += jump
  puts "#{$today}: population #{$colony.length}"
  jump.times do
    $colony.each do |person|
      new_day if person.alive?
    end
  end
  input = gets.chomp
  if input.downcase.include?('d')
    display
    input = gets.chomp
  end

end
