# frozen_string_literal: true

require 'spec_helper'
require_relative '../lab_6/pine_81_1'

FIRST_THIRTY = {
  0 => 'zero',  10 => 'ten',       20 => 'twenty',
  1 => 'one',   11 => 'eleven',    21 => 'twenty-one',
  2 => 'two',   12 => 'twelve',    22 => 'twenty-two',
  3 => 'three', 13 => 'thirteen',  23 => 'twenty-three',
  4 => 'four',  14 => 'fourteen',  24 => 'twenty-four',
  5 => 'five',  15 => 'fifteen',   25 => 'twenty-five',
  6 => 'six',   16 => 'sixteen',   26 => 'twenty-six',
  7 => 'seven', 17 => 'seventeen', 27 => 'twenty-seven',
  8 => 'eight', 18 => 'eighteen',  28 => 'twenty-eight',
  9 => 'nine',  19 => 'nineteen',  29 => 'twenty-nine'
}.freeze

describe 'anglicize' do
  before do
    Object.send(:public, :anglicize)
  end

  it "returns 'one' when given 1" do
    expect(anglicize(1)).to eq 'one'
  end

  it 'matches expectations for first 30 conversions' do
    aggregate_failures do
      FIRST_THIRTY.each do |k, v|
        p [k, v]
        expect(anglicize(k)).to eq v
      end
    end
  end
end
