require 'yaml'

BACKGROUNDS = YAML.load(File.read('./backgrounds.txt'))

def print_backgrounds
  BACKGROUNDS.each do |key, value|
    puts key
  end
end

puts "--Pick a background from this list, or OTHER--"
print_backgrounds

option = [gets.chomp.downcase]

unless BACKGROUNDS.include?(option)
  option = BACKGROUNDS.keys.sample
end

my_class = BACKGROUNDS[option]

line_width = 135

def display(key, value, line_width)
  puts key + ("-" * (line_width - (key.length + value.length))) + value
end

display("Background", option.join.capitalize, line_width)
display("Skills", my_class[:skills].join(", "), line_width)
display("Languages", my_class[:languages].join(", "), line_width)
display("Equipment", my_class[:equipment].join(", "), line_width)

[:traits, :traits, :ideals, :bond, :flaw].each do |trait|
  display(trait.to_s.capitalize, my_class[trait].sample, line_width)
end