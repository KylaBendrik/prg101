# frozen_string_literal: true

require 'spec_helper'
require_relative '../frequency'

describe Counter do
  let(:counter) { described_class.new }

  it 'detects that \'ng\' is a cluster' do
    expect(counter.count_clusters(['ng'])).to eq({'ng' => 1, 'n' => 1, 'g' => 1})
  end

  it 'detects that \'ae\' is a cluster' do
    expect(counter.count_clusters(['ae'])).to eq({'ae' => 1, 'a' => 1, 'e' => 1})
  end

  it 'detects that \'ht\' is not a cluster' do
    expect(counter.count_clusters(['ht'])).to eq({'h' => 1, 't' => 1})
  end

  it "gets {'a' => 1, 'c' => 1, 'e' => 1} for ['ace']" do
    input = ['ace']

    expect(counter.count_clusters(input)).to eq({"a"=>1, "c"=>1, "e"=>1})
  end

  it "gets {'a'=>2, 'c'=>1, 'e'=>1, 't'=>1} for ['ace', 'at']" do
    input = ['ace', 'at']
    expect(counter.count_clusters(input)).to eq({"a"=>2, "c"=>1, "e"=>1, "t"=>1})
  end

  it "gets {'h'=>1, 'e'=>1, 'l'=>2, 'o'=>1} for ['hello']" do
    input = ['hello']
    expect(counter.count_clusters(input)).to eq({'h'=>1, 'e'=>1, 'l'=>2, 'o'=>1})
  end
end