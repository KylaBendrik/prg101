# frozen_string_literal: true

CATEGORIES = {
  'bark' => 0,
  'leaves' => 0,
  'moss' => 0
}

def rename(old_name, file_type, batch_name, default_num)
  puts old_name  

  CATEGORIES.each do |cat, num|
    if old_name.downcase.include?(cat)

      extra = if old_name.downcase.include?('seamless')
        '_seamless'
      else
        ''
      end
     
      num += 1
      CATEGORIES[cat] = num
      puts "adding to category: #{cat} ##{num}"
      return "#{cat}/#{cat}#{num}#{extra}.#{file_type}"
    end
  end

  default_num += 1
  puts "no category found. Default Number assigned: #{default_num}"
  return "#{batch_name}#{default_num}.#{file_type}"

end

Dir.chdir 'C:/Users/BethJackson/Desktop/learn/lab_7/inputs/new_pictures'

pic_names_jpgs = Dir['../pictures/*.jpg']
pic_names_pngs = Dir['../pictures/*.png']

puts 'What would you like to call this batch?'

batch_name = gets.chomp

puts
print "Downloading #{pic_names_jpgs.length + pic_names_pngs.length} files:  "

pic_number = 1
default_number = 0

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


