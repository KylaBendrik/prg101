class Instruction
  attr_accessor :opcode, :parameters
  def initialize(number)
    array = number.digits
    @number = number
    @opcode = "#{array[1]}#{array[0]}".to_i
    @parameters = []

    i = 2
    (array.length - 2).times do 
      @parameters.push array[i]
      i +=1
    end

    @parameters = @parameters

  end
  def explain
    puts "Program: #{@number}"

    puts "Opcode: #{@opcode} #{define_opcode(opcode)}"
    puts "Parameters:"

    @parameters.each do |param|
      detail = ""
      if param == 0
        detail = "position mode"
      else
        detail = "immediate mode"
      end
      puts " - #{param} #{detail}"
    end
  end
  def define_opcode(opcode)
    case opcode
    when 1
      "ADD"
    when 2
      "MULT"
    when 3
      "IN"
    when 4
      "OUT"
    when 99
      "HALT"
    end
  end
end

class Program
  def initialize(string)
    @program_array = string.split(',')
  end
  def run
    @program_array.each do |number|

    end
  end
end

instruction = Instruction.new(10002)

instruction.explain

program = Program.new('3,225,1,225,6,6,1100,1,238,225,104,0')