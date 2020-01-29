class Confection
  def prepare
    # Don't duplicate this line in the subclass!
    puts "Baking at 350 degrees for 25 minutes."
  end
end

class Cupcake < Confection
  def prepare
    super
    puts "Applying frosting."
  end
end

# CREATE YOUR Cupcake SUBCLASS HERE!

# The below code should output the following
# 2 lines of text:
#
# Baking at 350 degrees for 25 minutes.
# Applying frosting.
cupcake = Cupcake.new
cupcake.prepare