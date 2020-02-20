grades = Hash.new('A')

p grades['Regina']

p grades

# so, if you ask for a key that's not in the hash, it DOESN'T add it, unless you assign something TO it...

grades['Regina'] = 'B'

p grades