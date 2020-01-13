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
    5 => 0,
    6 => 0,
    7 => 3,
    8 => 3,
    99 => 0
  }.freeze

  def initialize(tape, pointer)
    @tape = tape
    @pointer = pointer
  end

  def perform
    #goal: parameter return a single value, call each time?
    # params = parameters
    # pp params
    # puts "#{@tape[@pointer..@pointer + 3].inspect} => #{parameter(0)}, #{parameter(1)}"
    case opcode % 100
    when 1
      @tape[@tape[@pointer + 3]] = parameter(0) + parameter(1)
      :continue
    when 2
      @tape[@tape[@pointer + 3]] = parameter(0) * parameter(1)
      :continue
    when 3
      @tape[@tape[@pointer + 1]] = gets.to_i
      :continue
    when 4
      puts parameter(0)
      :continue
    when 5
      # jump if true
      if parameter(0) != 0
        @pointer = parameter(1)
      end
      :continue
    when 6
      #jump if false
      if parameter(0) == 0
        @pointer = parameter(1)
      end
      :continue
    when 7
      # less than
      if parameter(0) < parameter(1)
        @tape[parameter(2)] = 1
      else
        @tape[parameter(2)] = 0
      end
      :continue
    when 8
      # equals
      if parameter(0) == parameter(1)
        @tape[parameter(2)] = 1
      else
        @tape[parameter(2)] = 0
      end
      :continue
    when 99
      :halt
    else
      puts "Unknown opcode #{ opcode }"
    end
  end

  def opcode
    @tape[@pointer]
  end

  def next_position
    @pointer + (LENGTHS.fetch(opcode % 100) + 1)
  end

  def parameters
    types = parameter_types # [:immediate, :positional, :positional]
    params = []
    args = @tape[(@pointer + 1)..(@pointer + 3)]

    LENGTHS[opcode % 100].times do |param_num|
      arg = args[param_num]
      value = types[param_num] == :immediate ? arg : @tape[arg]
      params.push(value)
    end

    params
  end

  def parameter(offset)
    types = parameter_types # [:immediate, :positional, :positional]
    params = []
    args = @tape[(@pointer + 1)..(@pointer + 3)]

    LENGTHS[opcode % 100].times do |param_num|
      arg = args[param_num]
      value = types[param_num] == :immediate ? arg : @tape[arg]
      params.push(value)
    end

    params[offset]
  end

  def parameter_types
    types, operation = opcode.divmod(100)

    types_array = types.digits.fill(0, types.digits.length..2)

    result = []

    types_array.each do |digit|
      if digit == 1
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
    # create a new instruction
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
