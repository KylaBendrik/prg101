# frozen_string_literal: true

require 'spec_helper'
require_relative '../advent05b'

describe Computer do
  # 1,0,0,0,99 becomes 2,0,0,0,99 (1 + 1 = 2).
  it 'transforms sample 1 as expected' do
    expect(subject.run([1, 0, 0, 0, 99]))
      .to eq([2, 0, 0, 0, 99])
  end

  # 2,3,0,3,99 becomes 2,3,0,6,99 (3 * 2 = 6).
  it 'transforms sample 2 as expected' do
    expect(subject.run([2, 3, 0, 3, 99]))
      .to eq([2, 3, 0, 6, 99])
  end

  # 2,4,4,5,99,0 becomes 2,4,4,5,99,9801 (99 * 99 = 9801).
  it 'transforms sample 3 as expected' do
    expect(subject.run([2, 4, 4, 5, 99, 0]))
      .to eq([2, 4, 4, 5, 99, 9801])
  end

  # 1,1,1,4,99,5,6,0,99 becomes 30,1,1,4,2,5,6,0,99.
  it 'transforms sample 4 as expected' do
    expect(subject.run([1, 1, 1, 4, 99, 5, 6, 0, 99]))
      .to eq([30, 1, 1, 4, 2, 5, 6, 0, 99])
  end

  it 'transforms sample 0 as expected' do
    expect(subject.run([1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50]))
      .to eq([3500, 9, 10, 70, 2, 3, 11, 0, 99, 30, 40, 50])
  end
end