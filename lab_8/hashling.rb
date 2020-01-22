# frozen_string_literal: true

# collision options
# what is collision allgorithm?
# assign memory table size
# if hash is getting too full, re hash, double size, etc.
# array of arrays for table (COLS = hashed_value, key, value, order)

class Hashling
  def initialize(array_of_arrays)
    # create the table based on info supplied ^

    @scale = 2
    @table = create_table(array_of_arrays)

    @cell_width = 10
    puts "cell_width_original #{@cell_width}"
    @order = 0
    @collisions = 0
    @collisions_allowed = 15
    array_of_arrays.each do |key, value|
      assign(key, value)
    end
  end

  def create_table(arr)
    table = []
    # bookmark, key, value, order
    (arr.length * @scale).times do
      table.push([nil, nil, nil, nil])
    end
    puts "new table created: #{ arr.length * @scale } rows"
    # display(table)
    table
  end

  def hashify(key)
    # return integer
    
    max = @table.length

    first_ascii = key[0].ord
    
    length = key.length

    (length + first_ascii) % max
  end

  def assign(key, value)
    bookmark = hashify(key)
    order = @table.length
    insert(bookmark, [bookmark, key, value, @order])
    @order += 1
    if @collisions > @collisions_allowed
      puts 'force reset: too many collisions'
      reset
    end
    if filled_rows.length > @table.length * 0.75
      puts 'force reset: too full'
      reset
    end
  end

  def insert(index, row)
    index = 0 if index > @table.length
    if @table[index] == [nil, nil, nil, nil]
      @table[index] = row
    else
      @collisions += 1
      puts "collision detected (#{ @collisions }/#{ @collisions_allowed })"
      puts "#{ index } - #{ @table.length }"
      insert(index + 1, row)
    end
  end

  def showcase
    display(@table)
  end

  def display(table)
    table.each do |row|
      row.each do |cell|
        print display(cell)
      end
      puts ''
    end
  end

  def display(cell)
    cell_length = 0
    cell_info = ''
    unless cell.nil?
      puts cell
      cell_length = cell.to_s.length
      cell_info = cell.to_s
      puts "cell_length: #{cell_length}"
      puts "cell_width: #{@cell_width}"
      if cell_length > @cell_width
        @cell_width = @cell_width + 4
      end
    end
    margin = (@cell_width - cell_length) / 2
    extra = cell_length % 2

    '|' + (' ' * margin) + cell_info + (' ' * (margin + extra)) + '|'
  end

  def find(key)
    # first, hash key
    estimated_location = hashify(key)
    steps = 0
    # starting here ^, check to see if the key is correct
    while @table[estimated_location][1] != key && !@table[estimated_location][1].nil?
      steps += 1
      estimated_location += 1
    end

    if @table[estimated_location][1].nil?
      puts "unable to find #{key}"
    else
      puts "#{ @table[estimated_location][1] } => #{ @table[estimated_location][2] } (#{ steps } steps)"
    end

  end

  def filled_rows
    filled = []
    @table.each do |row|
      filled.push(row) unless row[1].nil?
    end
    filled.sort
  end

  def reset
    @collisions = 0
    new_table = filled_rows
    @table = create_table(new_table)

    new_table.each do |row|
      insert(row[0], row)
    end
  end
end

hashling1 = Hashling.new([%w[beth raspberry], %w[william red], %w[barthelomew blue], %w[mike cranberry]])

# hashling1.assign('michael', 'juniper')
# hashling1.assign('jen', 'azure')
# hashling1.assign('jeff', 'green')

# hashling1.find('jeff')

# hashling1.assign('jo', 'pink')
# hashling1.assign('carl', 'grey')
# hashling1.assign('nicole', 'maroon')

# hashling1.find('jeff')

hashling1.showcase
