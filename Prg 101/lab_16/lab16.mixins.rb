module Motorized
  def rev_motor
    puts "Revving motor! (vvrrrrroooom!)"
  end
end

module BatteryPowered
  def powerlevel
    @powerlevel || @powerlevel = 0
  end
  def powerlevel=(num)
    @powerlevel = num
  end
  def charge
    @powerlevel += 1
  end
end

class Drill
  include Motorized
  include BatteryPowered
end

class ElectricCar
  include Motorized
  include BatteryPowered
end

class Phone
  include BatteryPowered
end