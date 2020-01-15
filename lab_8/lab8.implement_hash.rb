# frozen_string_literal: true

# collision options
# what is collision allgorithm?
# assign memory table size
# if hash is getting too full, re hash, double size, etc.
# array of arrays for table (COLS = hashed_value, key, value, order)

class Hashling
  def initialize(array_of_arrays)
    # create the table based on info supplied ^
    @table = create_table(array_of_arrays)
    puts 'new table created'
    array_of_arrays.each do |key, value|
      assign(key, value)
    end
  end

  def create_table(arr)
    table = []
    # bookmark, key, value, order
    (arr.length * 4).times do
      table.push([nil, nil, nil, nil])
    end
    table
  end

  def hashify(key)
    # return integer
    key.length
  end

  def assign(key, value)
    bookmark = hashify(key)
    order = @table.length
    insert(bookmark, [bookmark, key, value, order])
  end

  def insert(index, row)
    if @table[index] == [nil, nil, nil, nil]
      @table[index] = row
    else
      puts "collision detected"
      insert(index + 1, row)
    end
  end

  def to_s
    @table.each do |row|
      row.each do |cell|
        print display(cell)
      end
      puts ''
    end
  end

  def display(cell)
    cell_width = 10
    cell_length = 0
    cell_info = ''
    unless cell.nil?
      cell_length = cell.to_s.length
      cell_info = cell.to_s
    end
    margin = (cell_width - cell_length) / 2
    extra = cell_length % 2

    '|' + (' ' * margin) + cell_info + (' ' * (margin + extra)) + '|'
  end
end

hashling1 = Hashling.new([%w[beth raspberry], %w[bob red], %w[eric blue], %w[mike cranberry]])

puts hashling1
