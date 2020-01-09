# frozen_string_literal: true

CATEGORIES = {}


def find_extra(old_name)
  if old_name.downcase.include?('seamless')
    '_seamless'
  else
    ''
  end
end

def assign_name(cat, num, file_type, old_name)
  puts "adding to category: #{cat} ##{num}"

  extra = find_extra(old_name)

  "#{cat}/#{cat}#{num}#{extra}.#{file_type}"
end

def rename(old_name, file_type, batch_name, default_num)
  puts old_name

  CATEGORIES.each do |cat, num|
    next unless old_name.downcase.include?(cat)

    num += 1
    CATEGORIES[cat] = num

    return assign_name(cat, num, file_type, old_name)
  end

  # if category not found, ask if you'd like to create one
  puts 'No category found. Would you like to create one? (yes or no)'
  if gets.chomp.downcase.include?('y')
    print 'New category: '
    new_cat = gets.chomp.downcase

    puts "adding to category: #{new_cat} ##{1}"

    unless Dir.exist?(new_cat)
      Dir.mkdir(File.join('C:/Users/BethJackson/Desktop/learn/lab_7/inputs/new_pictures', new_cat))
    end

    CATEGORIES[new_cat] = 1

    return assign_name(new_cat, 1, file_type, old_name)
  end

  default_num += 1
  puts "no category found. Default Number assigned: #{default_num}"
  "#{batch_name}#{default_num}.#{file_type}"
end

Dir.chdir 'C:/Users/BethJackson/Desktop/learn/lab_7/inputs/new_pictures'

# next task: find the directories in here already, and set up the above CATEGORIES hash



default_number = Dir['*.jpg'].length + Dir['*.png'].length

pic_names_jpgs = Dir['../pictures/*.jpg']
pic_names_pngs = Dir['../pictures/*.png']

Dir.each_child('./') {|x| puts "Got #{x}"
 unless x.include?('.jpg') || x.include?('.png')
  arr_length = Dir["./#{x}/*.jpg"].length + Dir["./#{x}/*.png"].length
  CATEGORIES[x] = arr_length
 end
}

puts 'What would you like to call this batch?'

batch_name = gets.chomp

puts
print "Downloading #{pic_names_jpgs.length + pic_names_pngs.length} files:  "

pic_number = 1


pic_names_jpgs.each do |name|
  print '.'
  new_name = rename(name, 'jpg', batch_name, default_number)

  File.rename name, new_name

  pic_number += 1
end

pic_names_pngs.each do |name|
  print '.'
  new_name = rename(name, 'png', batch_name, default_number)

  File.rename name, new_name

  pic_number += 1
end

puts
puts 'Done!'
