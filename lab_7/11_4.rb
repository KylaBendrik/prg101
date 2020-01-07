# frozen_string_literal: true

# YAML

require 'yaml'

test_array = ['Give Quiche a Chance',
              'Mutants Out!',
              'Chameleonic Live-Forms, No Thanks']

test_string = test_array.to_yaml

filename = 'RimmerTShirts.txt'

File.open filename, 'w' do |f|
  f.write test_string
end

read_string = File.read filename

read_array = YAML.safe_load read_string
