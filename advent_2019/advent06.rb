# frozen_string_literal: true

class Orbit
  attr_accessor :star, :planet
  def initialize(star, planet)
    @star = star
    @planet = planet

    # display
  end

  def display
    puts "#{@planet} is in orbit around #{@star}"
  end
end

class Body
  attr_accessor :children, :id
  def initialize(id)
    @id = id
    @children = []
  end
  def add_child(child)
    @children.push(child)
  end
end

class Map
  attr_accessor :orbit_list

  def initialize(input)
    @orbit_list = []
    @bodies = []
    @direct_orbits = 0
    @indirect_orbits = 0
    input.each do |line|
      array = line.split(')')
      star = array[0]
      planet = array[1].chomp
      @orbit_list.push(Orbit.new(star, planet))
    end

    def check_body(id_num)
      unless @bodies.all? { |body|
        body.id != id_num
      } do
        new_body = Body.new(orbit[0])
        return new_body
      end
    end

    def find_all_bodies
      #go through orbit list. If we don't have the body yet, assign, if we do, add child
      @orbit_list.each do |orbit|

        unless @bodies.all? { |body|
          body.id != orbit[0]
        } do
          new_body = Body.new(orbit[0])
          @bodies.push(new_body)
        end

        body1 = check_body(orbit[0])
        body2 = check_body(orbit[1])
        
        unless @bodies.all? { |body|
          body.id != orbit[1]
        } do
          new_body = Body.new(orbit[1])
          @bodies.push(new_body)
        end
      
      end
    end
  end

  def count_direct

  end

  def display
    @orbit_list.each(&:display)
  end
end

input = File.read('./advent06_input.txt').lines
puts input[0]
puts input[1]

map = Map.new(input)
