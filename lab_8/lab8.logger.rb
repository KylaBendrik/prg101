$depth = 0

def indent(depth)
  print "  " * depth
end

def log(block, block_description)
  puts "#{indent($depth)}new block: #{block_description}"
  $depth += 1
  indent($depth)
    block.call
  $depth -= 1
  puts "#{indent($depth)}end block: #{block_description}"
end

block1 = Proc.new do
  puts "DOING STUFF"

  block1a = Proc.new do
    puts "DoInG ThInGs"
  end

  log(block1a, 'block 1a')
end

block2 = Proc.new do
  puts "This is a new block"

  block2a = Proc.new do
    puts "This is a new sub block"
  end
  block2b = Proc.new do
    puts "This is a sibling of the previous sub block"

    block2ba = Proc.new do
      puts "This is a child of the sub block's sibling"
    end
    
    log(block2ba, 'block 2ba')
  end
  log(block2a, 'block 2a')
  log(block2b, 'block 2b')
end

log(block1, 'block 1')
log(block2, 'block 2')