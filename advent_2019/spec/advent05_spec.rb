# frozen_string_literal: true

require 'spec_helper'
require_relative '../advent05b'

describe Computer do

  before do
    prgs = {
      'PRG1' => [3, 9, 8, 9, 10, 9, 4, 9, 99, -1, 8],
      'PRG2' => [3, 9, 7, 9, 10, 9, 4, 9, 99, -1, 8],
      'PRG3' => [3, 3, 1108, -1, 8, 3, 4, 3, 99],
      'PRG4' => [3, 3, 1107, -1, 8, 3, 4, 3, 99],
      'PRG5' => [3, 12, 6, 12, 15, 1, 13, 14, 13, 4, 13, 99, -1, 0, 1, 9],
      'PRG6' => [3, 3, 1105, -1, 9, 1101, 0, 0, 12, 4, 12, 99, 1],
      'PRG7' => [
        3, 21, 1008, 21, 8, 20, 1005, 20, 22, 107, 8, 21, 20, 1006, 20, 31,
        1106, 0, 36, 98, 0, 0, 1002, 21, 125, 20, 4, 20, 1105, 1, 46, 104,
        999, 1105, 1, 46, 1101, 1000, 1, 20, 4, 20, 1105, 1, 46, 98, 99
      ]
    }
    prgs.each { |k, v| stub_const(k, v) }
  end

  # 1,0,0,0,99 becomes 2,0,0,0,99 (1 + 1 = 2).
  it 'transforms sample 1 as expected' do
    expect(described_class.new([1, 0, 0, 0, 99]).run)
      .to eq([2, 0, 0, 0, 99])
  end

  # 2,3,0,3,99 becomes 2,3,0,6,99 (3 * 2 = 6).
  it 'transforms sample 2 as expected' do
    expect(described_class.new([2, 3, 0, 3, 99]).run)
      .to eq([2, 3, 0, 6, 99])
  end

  # 2,4,4,5,99,0 becomes 2,4,4,5,99,9801 (99 * 99 = 9801).
  it 'transforms sample 3 as expected' do
    expect(described_class.new([2, 4, 4, 5, 99, 0]).run)
      .to eq([2, 4, 4, 5, 99, 9801])
  end

  # 1,1,1,4,99,5,6,0,99 becomes 30,1,1,4,2,5,6,0,99.
  it 'transforms sample 4 as expected' do
    expect(described_class.new([1, 1, 1, 4, 99, 5, 6, 0, 99]).run)
      .to eq([30, 1, 1, 4, 2, 5, 6, 0, 99])
  end

  it 'transforms sample 0 as expected' do
    expect(described_class.new([1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50]).run)
      .to eq([3500, 9, 10, 70, 2, 3, 11, 0, 99, 30, 40, 50])
  end

  it 'handles opcode 3' do
    # allow(STDIN).to receive(:gets).and_return("42\n")
    allow_any_instance_of(Kernel).to receive(:gets).and_return("42\n")
    expect(described_class.new([3, 3, 99, 0]).run).to eq([3, 3, 99, 42])
  end

  it 'handles opcode 4' do
    expect { described_class.new([4, 3, 99, 42]).run }.to output("started\n42\n").to_stdout
  end

  it 'handles immediate parameters' do
    expect(described_class.new([1002, 4, 3, 4, 33]).run)
      .to eq([1002, 4, 3, 4, 99])
  end

  it 'handles negative numbers' do
    expect(described_class.new([1101, 100, -1, 4, 0]).run)
      .to eq([1101, 100, -1, 4, 99])
  end

  it 'detects input == 8 using position mode' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("8\n")
    expect { described_class.new(PRG1.dup).run }.to output("INPUT: OUTPUT: 1\n").to_stdout
  end

  it 'detects input != 8 using position mode' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("42\n")
    expect { described_class.new(PRG1.dup).run }.to output("INPUT: OUTPUT: 0\n").to_stdout
  end

  it 'detects input < 8 using position mode' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("7\n")
    expect { described_class.new(PRG2.dup).run }.to output("INPUT: OUTPUT: 1\n").to_stdout
  end

  it 'detects input !< (==) 8 using position mode' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("8\n")
    expect { described_class.new(PRG2.dup).run }.to output("INPUT: OUTPUT: 0\n").to_stdout
  end

  it 'detects input !< (>) 8 using position mode' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("9\n")
    expect { described_class.new(PRG2.dup).run }.to output("INPUT: OUTPUT: 0\n").to_stdout
  end

  it 'detects input == 8 using immediate mode' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("8\n")
    expect { described_class.new(PRG3.dup).run }.to output("INPUT: OUTPUT: 1\n").to_stdout
  end

  it 'detects input != 8 using immediate mode' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("42\n")
    expect { described_class.new(PRG3.dup).run }.to output("INPUT: OUTPUT: 0\n").to_stdout
  end

  it 'detects input < 8 using immediate mode' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("7\n")
    expect { described_class.new(PRG4.dup).run }.to output("INPUT: OUTPUT: 1\n").to_stdout
  end

  it 'detects input !< (==) 8 using immediate mode' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("8\n")
    expect { described_class.new(PRG4.dup).run }.to output("INPUT: OUTPUT: 0\n").to_stdout
  end

  it 'detects input !< (>) 8 using immediate mode' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("9\n")
    expect { described_class.new(PRG4.dup).run }.to output("INPUT: OUTPUT: 0\n").to_stdout
  end

  it 'detects zero using jump with position mode' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("0\n")
    expect { described_class.new(PRG5.dup).run }.to output("INPUT: OUTPUT: 0\n").to_stdout
  end

  it 'detects non-zero using jump with position mode' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("1\n")
    expect { described_class.new(PRG5.dup).run }.to output("INPUT: OUTPUT: 1\n").to_stdout
  end

  it 'detects zero using jump with immediate mode' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("0\n")
    expect { described_class.new(PRG6.dup).run }.to output("INPUT: OUTPUT: 0\n").to_stdout
  end

  it 'detects non-zero using jump with immediate mode' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("1\n")
    expect { described_class.new(PRG6.dup).run }.to output("INPUT: OUTPUT: 1\n").to_stdout
  end

  it 'prints 999 for input < 8' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("7\n")
    expect { described_class.new(PRG7.dup).run }.to output("INPUT: OUTPUT: 999\n").to_stdout
  end

  it 'prints 1000 for input == 8' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("8\n")
    expect { described_class.new(PRG7.dup).run }.to output("INPUT: OUTPUT: 1000\n").to_stdout
  end

  it 'prints 1001 for input > 8' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("9\n")
    expect { described_class.new(PRG7.dup).run }.to output("INPUT: OUTPUT: 1001\n").to_stdout
  end
end
