# frozen_string_literal: true

# make an AI learn how to effeciently play the number guessing game

max = 5
turns = 3
gens = 1
brains = 1

class Game
  attr_accessor :goal
  def initialize(max)
    @goal = rand(1..max)
    puts "Goal: #{@goal}"
  end
end

class Brain
  def initialize(turns, _max)
    # input layer (previous guesses)
    # hidden layer (middle nodes)
    # output layer (as many as possible choices)
    # I    H     O
    # I         O
    # each node goes to every node in the next layer
    # numbers to look at are the lines and the hidden numbers
    @guesses = []
    @hidden_layer = []
    @output_node = 0

    # creating blank guesses array with tuples [guess, result]
    turns.times do
      @guesses.push [0, 0]
      # # of hidden neurons should be 2/3 the size of the input layer, plus the size of the output layer.
      # inputs = 6, output = 1, so, 4 + 1 = 5?
    end

    # creating hidden nodes
    num_hidden_nodes = (((turns * 2) / 3) * 2) + 1

    num_hidden_nodes.times do
      @hidden_layer.push Node.new(turns * 2)
    end

    # creating output node
    @output_node = Node.new(num_hidden_nodes)

    puts "Brain's guesses array: #{@guesses.inspect}"
  end

  class Node
    def initialize(num_inputs)
      # each node has an array of weights, based on how many inputs there are.
      @weights = []
      num_inputs.times do
        @weights.push rand
      end
      puts 'initializing node'
    end

    def read(input_array)
      # sum of inputs * their associated weights
      result = 0
      index = 0

      input_array.each do |input|
        result += input * @weights[0]
        index += 1
      end

      puts result
    end
  end

  def simplify_tuples(tuple_array)
    new_array = []

    tuple_array.each do |tuple|
      new_array.push tuple[0]
      new_array.push tuple[1]
    end

    new_array
  end

  def guess(max, goal, current_turn)
    # each time the brain will guess a new number, we need to go through all the nodes, then the output node, then a translator function

    @hidden_layer.each do |node|
      puts 'calculating node'

      new_array = @guesses.simplify_tuples

      puts node.read(new_array)
    end

    guess = rand(1..max)
    puts "guessing #{guess}"

    if guess == goal
      puts 'GUESSED CORRECTLY!!!!'

      true
    else
      result = 0

      if guess > goal
        puts 'Too high!'
        result = 1
      elsif guess < goal
        puts 'Too low!'
        result = -1
      end

      @guesses[current_turn] = [guess, result]

      puts "Brain's guesses array: #{@guesses.inspect}"

      false
    end
  end
end

game1 = Game.new(max)

brain1 = Brain.new(turns, max)

current_turn = 0

turns.times do
  current_turn += 1
  break if brain1.guess(max, game1.goal, current_turn - 1)
end

puts 'Out of turns!' if current_turn > turns
