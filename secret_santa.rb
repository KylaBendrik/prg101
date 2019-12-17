class Person
  attr_accessor :name, :age, :num_presents
  def initialize(name, age)
    @name = name
    @age = age
    @num_presents = 0
    @id = rand(1000..9999)
  end
  def debugging
    puts "#{@name}(#{@age}): #{num_presents} presents gifted so far."
  end
  def display
    puts #{@name}(#{@age}):
  end
end

class Family
  attr_accessor :family
  def initialize(fam)
    @family = []
    fam.each do |person|
      @family.push(Person.new(person[0], person[1], @family.length))
    end
  end
  def display_all
    @family.each do |person|
      person.display
    end
  end
  def pick_recipients(r)
    
  end
end

fam = [
  ['Grandpa', 70],
  ['Grandma', 70],
  ['Ted', 50],
  ['Heidi', 50],
  ['Jo', 22],
  ['James', 19],
  ['Jeremy', 70],
  ['Ellen', 70],
  ['Nathan', 19],
  ['Daniel', 50],
  ['Vicki', 50],
  ['Beth', 25],
  ['William', 27],
  ['Rose', 1]
]

ashton_fam = Family.new(fam)
ashton_fam.display_all

puts "Hello! Please enter your id number: "