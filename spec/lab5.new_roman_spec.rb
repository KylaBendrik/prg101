# frozen_string_literal: true

require 'spec_helper'
require_relative '../lab5.new_roman'

FIRST_THIRTY = {
  1 => 'I',    11 => 'XI',    21 => 'XXI',
  2 => 'II',   12 => 'XII',   22 => 'XXII',
  3 => 'III',  13 => 'XIII',  23 => 'XXIII',
  4 => 'IV',   14 => 'XIV',   24 => 'XXIV',
  5 => 'V',    15 => 'XV',    25 => 'XXV',
  6 => 'VI',   16 => 'XVI',   26 => 'XXVI',
  7 => 'VII',  17 => 'XVII',  27 => 'XXVII',
  8 => 'VIII', 18 => 'XVIII', 28 => 'XXVIII',
  9 => 'IX',   19 => 'XIX',   29 => 'XXIX',
  10 => 'X',   20 => 'XX',    30 => 'XXX'
}.freeze

VARIOUS = {
  0     => '',
  99    => 'XCIX',
  100   => 'C',
  499   => 'CDXCIX',
  1_000 => 'M',
  1967  => 'MCMLXVII',
  2_500 => 'MMD'
}.freeze

describe 'numeralize' do
  before do
    Object.send(:public, *Object.private_instance_methods)
  end

  it 'matches expectations for various conversions' do
    VARIOUS.each do |k, v|
      expect(numeralize(k)).to eq v
    end
  end

  it 'matches Wolfram for the first 30 conversions' do
    FIRST_THIRTY.each do |k, v|
      expect(numeralize(k)).to eq v
    end
  end
end
