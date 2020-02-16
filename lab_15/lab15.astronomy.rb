#Hash default BLOCKS

class CelestialBody
  attr_accessor :type, :name
end

#create the hash
bodies = Hash.new do |hash, key| #< when the block is called later, it will recieve a reference to the hash and the key being accessed
  # set up the object, which will become the VALUE for this KEY
  body = CelestialBody.new
  body.name = key
  body.type = "planet"
  #assign the object to the current hash KEY
  hash[key] = body
  # return the object ^
end

p bodies['Venus']

pp bodies