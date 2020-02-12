require 'yaml'

class Background
  def initialize
    info = {name: 1, skills: 2, languages: 2, equipment: 1, traits: 8, ideals: 6, bond: 6, flaw: 6}
    entry = {}
    info.each do |key, value|
      array = []
      print "Please enter the #{key} (#{value}): "
      value.times do 
        array.push gets.chomp
      end
      entry[key] = array
    end
    #import old data
    unless File.read('./backgrounds.txt') == ""
      data = YAML.load(File.read('./backgrounds.txt'))
    else
      data = {}
    end

    name_of_background = entry[:name]
    data[name_of_background] = entry
    # save info!
    File.open './backgrounds.txt', 'w' do |f|
      f.write data.to_yaml
    end
  end
end

back = Background.new