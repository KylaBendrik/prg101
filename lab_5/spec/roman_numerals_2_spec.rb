require 'spec_helper'
require_relative '../roman_numerals_2'

describe 'numeralize' do
  before do
    Object.send(:public, *Object.private_instance_methods)
  end

  it 'returns an empty string for 0' do
    expect(numeralize(0)).to eq('')
  end

  it 'returns \'IIII\' for 4' do
    expect(numeralize(4)).to eq('IIII')
  end

  it 'returns \'MDCCCCLXXXXIIII\' for 1994' do
    expect(numeralize(1994)).to eq('MDCCCCLXXXXIIII')
  end
end