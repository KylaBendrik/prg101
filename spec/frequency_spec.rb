# frozen_string_literal: true

require 'spec_helper'
require_relative '../frequency'

describe count_clusters(array) do
  it "gets {'a' => 1, 'c' => 1, 'e' => 1} for 'ace'" do
    expect(count_clusters(['ace'])).to eq {"a"=>1, "c"=>1, "e"=>1})
  end
end