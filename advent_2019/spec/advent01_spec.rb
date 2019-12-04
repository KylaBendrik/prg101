# frozen_string_literal: true

# For a mass of 12, divide by 3 and round down to get 4,
#   then subtract 2 to get 2.
# For a mass of 14, dividing by 3 and rounding down still yields 4,
#   so the fuel required is also 2.
# For a mass of 1969, the fuel required is 654.
# For a mass of 100756, the fuel required is 33583.

# to find the fuel required for a module, take its mass, divide by three,
# round down, and subtract 2.

require 'spec_helper'
require_relative '../advent01'

describe Advent1 do
  it 'gets 2 for 12' do
    expect(subject.fuel(12)).to eq 2
  end

  it 'gets 2 for 14' do
    expect(subject.fuel(14)).to eq 2
  end

  it 'gets 654 for 1969' do
    expect(subject.fuel(1969)).to eq 966
  end

  it 'gets 33583 for 100756' do
    expect(subject.fuel(100_756)).to eq 50_346
  end

  it 'sums two modules requirements' do
    expect(subject.total_fuel([12, 14])).to eq 4
  end

  it 'sums four modules requirements' do
    expect(subject.total_fuel([12, 14, 1969, 100_756])).to eq(4 + 966 + 50_346)
  end
end