# frozen_string_literal: true

require 'spec_helper'
require_relative '../advent05b'



describe Computer do
  it 'transforms 100099 to 200099' do
    comp = described_class.new([1,0,0,0,99])

    comp.run

    expect(comp.tape).to eq([2,0,0,0,99])
  end

  it 'transforms 200099 to 400099' do
    comp = described_class.new([2,0,0,0,99])

    comp.run

    expect(comp.tape).to eq([4,0,0,0,99])
  end
  it 'transforms 2,3,0,3,99 to 2,3,0,6,99' do
    comp = described_class.new([2,3,0,3,99])

    comp.run

    expect(comp.tape).to eq([2,3,0,6,99])
  end
  it 'transforms 2,4,4,5,99,0 to 2,4,4,5,99,9801' do
    comp = described_class.new([2,4,4,5,99,0])

    comp.run

    expect(comp.tape).to eq([2,4,4,5,99,9801])
  end
  it 'transforms 1,1,1,4,99,5,6,0,99 to 30,1,1,4,2,5,6,0,99' do
    comp = described_class.new([1,1,1,4,99,5,6,0,99])

    comp.run

    expect(comp.tape).to eq([30,1,1,4,2,5,6,0,99])
  end

  it 'handles an immediate negative value' do
    comp = described_class.new([101, -300, 5, 5, 99, 300])

    comp.run

    expect(comp.tape).to eq([101, -300, 5, 5, 99, 0])
  end
end

describe Instruction do
  describe '#parameter_types' do
    it 'defaults to positional' do
      instruction = Instruction.new([1, 0, 0, 0], 0)

      expect(instruction.parameter_types).to eq([:positional, :positional, :positional])
    end

    it 'allows the first parameter to be immediate' do
      instruction = Instruction.new([101, 0, 0, 0], 0)

      expect(instruction.parameter_types).to eq([:immediate, :positional, :positional])
    end
    it 'works even for outputting' do
      instruction = Instruction.new([104, 0, 0, 0], 0)

      expect(instruction.parameter_types).to eq([:immediate, :positional, :positional])
    end
    it 'allows two parameters to be immediate' do
      instruction = Instruction.new([1101, 0, 0, 0], 0)

      expect(instruction.parameter_types).to eq([:immediate, :immediate, :positional])
    end
  end
end

# describe Int_code do
#   it 'describes an opcode 1 with detail: ADD' do
#     code = described_class.new([1])

#     code.define

#     expect(code.detail).to eq('ADD')
#   end
# end