require 'sinatra'

def roll_die(sides)
  rand(sides) + 1
end

get('/roll/:num') do 
  die_size = params['num'].to_i
  if [4, 6, 20].include?(die_size)
    "Rolling #{die_size}-sided die: #{roll_die(die_size)}"
  else
    "Sorry, that's not an acceptable die size..."
  end
end