# frozen_string_literal: true

# Defines module fuel requirements
class Advent2
  # Implement an Intcode computer
  def run(prg_ary)
    # You need an Instruction Pointer integer, initialized to 0.
    pointer = 0
    known_instructions = [1, 2, 99]
    # Loop over prg_ary as long as the Instruction you're pointing
    #   to is one of the known instructions
    while known_instructions.include?(prg_ary[pointer])
      opcode = prg_ary[pointer]
      param1 = prg_ary[pointer + 1]
      param2 = prg_ary[pointer + 2]
      destination = prg_ary[pointer + 3]

      if opcode == 1 || opcode == 2
        
        first_num = prg_ary[param1]
        second_num = prg_ary[param2]
        if prg_ary[pointer] == 1
          prg_ary[destination] = first_num + second_num
        else
          prg_ary[destination] = first_num * second_num
        end
      end
      if prg_ary[pointer + 4] == 99
        break
      else
        pointer += 4
      end
    end

    # Inside the loop:
    #   Make a note of your output address (found at 3 after the instruction).
    #   Make a note of each of the inputs addresses (found at 2 and 1 after
    #     the instruction).
    #   Perform the calculation according to the instruction.
    #   Store the result at the output address.
    #   Increment your Instruction Pointer by 4.

    # Return the modified program.
    prg_ary
  end
end

input =
  [
    1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,13,19,1,10,19,23,2,9,23,27,1,6,27,31,1,10,31,35,1,35,10,39,1,9,39,43,1,6,43,47,1,10,47,51,1,6,51,55,2,13,55,59,1,6,59,63,1,10,63,67,2,67,9,71,1,71,5,75,1,13,75,79,2,79,13,83,1,83,9,87,2,10,87,91,2,91,6,95,2,13,95,99,1,10,99,103,2,9,103,107,1,107,5,111,2,9,111,115,1,5,115,119,1,9,119,123,2,123,6,127,1,5,127,131,1,10,131,135,1,135,6,139,1,139,5,143,1,143,9,147,1,5,147,151,1,151,13,155,1,5,155,159,1,2,159,163,1,163,6,0,99,2,0,14,0
  ]

adv2 = Advent2.new



# do the same for the other value you're looking for



# Look for the input that produces 19690720 in [0]
(0..99).each do |noun|
  (0..99).each do |verb|
    new_code = [].replace(input)
    new_code[1] = noun
    new_code[2] = verb
    output = adv2.run(new_code)
    next unless output[0] == 19_690_720
    puts output[0]
    puts ("Noun: #{noun}, Verb: #{verb}")
    puts 100 * noun + verb
    # Fill in this code for part two

  end
end

  # what should go here?
