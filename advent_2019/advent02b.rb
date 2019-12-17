# frozen_string_literal: true

class Instruction
  attr_accessor :value, :detail

  OP_CODES = {
    1 => 'ADD',
    2 => 'MULT',
    3 => 'IN',
    4 => 'OUT',
    99 => 'HALT'
  }.freeze

  LENGTHS = {
    1 => 3,
    2 => 3,
    3 => 1,
    4 => 1,
    99 => 0
  }

  def initialize(tape, pointer)
    @tape = tape
    @pointer = pointer
  end
  def perform
    case opcode
    when 1
      @tape[parameters[2]] = @tape[parameters[0]] + @tape[parameters[1]]
      :continue
    when 2
      @tape[parameters[2]] = @tape[parameters[0]] * @tape[parameters[1]]
      :continue
    when 3
      @tape[parameters[0]] = gets.to_i
      :continue
    when 4
      puts @tape[parameters[0]]
      :continue
    when 99
      :halt
    end
  end
  def opcode
    @tape[@pointer]
  end
  def next_position
    @pointer + (LENGTHS.fetch(opcode % 100) + 1)
  end
  def parameters
    types = parameter_types #[:immediate, :positional, :positional]
    params = []
    args = @tape[(@pointer + 1)..(@pointer + 3)]

    LENGTHS[opcode%100].times do |param_num|
      arg = args[param_num]
      value = types[param_num] == :immediate ? arg : @tape[arg]
      params.push(value)
    end

    return @tape[(@pointer + 1)..(@pointer + 3)]
  end
  def parameter_types
    types, operation = opcode.divmod(100)

    types_array = types.digits.fill(0, types.digits.length..2)

    result = []

    types_array.each do |digit|
      if  digit == 1
        result.push(:immediate)
      else
        result.push(:positional)
      end
    end

    result
  end
end

class Computer
  attr_accessor :tape, :pointer
  def initialize(array)
    @pointer = 0
    @tape = array
  end

  def step
    #create a new instruction
    instruction = Instruction.new(@tape, @pointer)
    new_pointer = instruction.next_position
    result = instruction.perform
    @pointer = new_pointer
    result
  end

  def run
    puts 'started'
    result = step until result == :halt
  end
end

input = File.read('./advent05b_input.txt').split(',').map(&:to_i)

# input = [3,0,4,0,99]

computer = Computer.new(input)

computer.run
