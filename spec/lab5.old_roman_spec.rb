# frozen_string_literal: true

require 'spec_helper'
require_relative '../lab5.old_roman'

describe 'numeralize' do
  before do
    Object.send(:public, *Object.private_instance_methods)
  end

  it 'returns an empty string for 0' do
    expect(numeralize(0)).to eq ''
  end

  it 'returns \'IIII\' for 4' do
    expect(numeralize(4)).to eq 'IIII'
  end

  it 'returns \'M\' for 1,000' do
    expect(numeralize(1_000)).to eq 'M'
  end

  it 'returns \'C\' for 100' do
    expect(numeralize(100)).to eq 'C'
  end

  it 'returns \'MMD\' for 2,500' do
    expect(numeralize(2_500)).to eq 'MMD'
  end

  it 'returns \'MDCCCCLXVII\' for 1967' do
    expect(numeralize(1967)).to eq 'MDCCCCLXVII'
  end
end
