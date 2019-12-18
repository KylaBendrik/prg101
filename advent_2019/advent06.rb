input = File.read('./advent06_input.txt')

orbits = {}
input.lines.each do |line|
  host, sat = line.split(')')
  orbits[host] ||= []
  orbits[host].push sat.chomp
end

def num_orbits(orbits, current, depth)
  sats = orbits[current]
  return depth if sats.nil? || sats.empty?
  sats
    .map {|sat| num_orbits(orbits, sat, depth + 1)}
    .sum + depth
end

puts num_orbits(orbits, 'COM', 0)