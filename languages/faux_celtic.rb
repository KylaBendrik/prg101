require 'yaml'

current_file = 1000
# read hashes
while File.exist?("./inputs/fc_#{current_file}")
  current_file += 1
end

$file_num = current_file
$filename = "./inputs/fc_#{$file_num}"
#is there a 
# Save hashes for next time.



def export(hashes)
  today = Time.new

  data = {
    saved_at: today,
    letter_pairings: hashes
  }
  
  File.open $filename, 'w' do |f|
    f.write data.to_yaml
  end
end

VOWELS_EXPLAINED = {
  'cat' => 'a',
  'father' => 'aa',
  'get' => 'e',
  'tin' => 'ii',
  'evil' => 'i',
  'top' => 'o',
  'go' => 'oo',
  'brute' => 'u'
}.freeze



$vowels = %w[a aa e ii i o oo u]

$vowel_hash = {}

$diphthongs = %w[ei ai ui eu ue au ia]

$diphthong_hash = {}

$consonants = %w[p t k f v s sh kh m n gn ng lj j r rr]

$consonant_hash = {}

$cc1 = %w[p t k m n f v s sh rr]
$cc2 = %w[l r s]

$cc1_hash = {}
$cc2_hash = {}

CCC2 = %w[p t k f]
CCC3 = %w[j r l m n ng gn]

$ccc2_hash = {}
$ccc3_hash = {}

# more sonorous are more internal
# most son to least son >>>
# [j] >> [r] >> [l] >> [m n ng gn] >> [f s sh x] >> [p t k]

# ɲ = gn or ñ
# ʎ = ll in million - similar to lj
def pick_letter(hash, set, original)
  # Get rid of bits in arrays when you pick them
  #return a specific one for whatever you get. Get a consistent result!
  if hash[original].nil?
    puts "We haven't picked a translation for '#{original}'"
    puts "-- Please pick one of the following: "
    set.each do |letter|
      print " #{letter} -"
    end
    puts ''
    input = gets.chomp.downcase
    until set.include?(input)
      puts "-- Please pick one of the above choices!"
      input = gets.chomp.downcase
    end
    hash[original] = input
  end
  return hash[original]
end

def open
  print "Open previous save file? This will overwrite current progress. (yes or no?) "
  input = gets.chomp.downcase
  if input == 'yes'
    puts "select file from list"
    Dir.each_child('inputs') {|x| puts "- #{x}"}
    open_file = "inputs/#{gets.chomp.downcase}"
    until File.exist?(open_file)
      puts "Please select file from list"
      open_file = "inputs/#{gets.chomp.downcase}"
    end
    data = YAML.load(File.read(open_file))
    $vowel_hash, $diphthong_hash, $consonant_hash, $cc1_hash, $cc2_hash, $ccc2_hash, $ccc3_hash = data[:letter_pairings]
  end
end

def trans(english_word)
  original = "#{english_word}"
  translation = syllable(english_word, :initial)
  puts "#{original} => #{translation}"
end

def syllable(eng_word, location)
  onset, left = capture(eng_word, location, :consonant)
  onset_length = onset.length

  new_syll = ''
  new_word = ''

  if onset_length == 0
    
  elsif onset_length == 1
    new_syll = new_syll + pick_letter($consonant_hash, $consonants, onset)
  elsif onset_length >= 3 && location == :initial
    new_syll = new_syll + "s#{pick_letter($ccc2_hash, CCC2, onset)}#{pick_letter($ccc3_hash, CCC3, onset)}"
  else
    new_syll = new_syll + "#{pick_letter($cc1_hash, $cc1, onset)}#{pick_letter($cc2_hash, $cc2, onset)}"
  end

  vowel, left = capture(left, :vowel, :vowel)
  if vowel.length == 1
    new_syll = new_syll + pick_letter($vowel_hash, $vowels, vowel)
  else
    new_syll = new_syll + pick_letter($diphthong_hash, $diphthongs, vowel)
  end

  coda, left = capture(left, :coda, :consonant)

  if coda.length == 0
    # do nothing
  elsif coda.length == 1
    new_syll = new_syll + pick_letter($consonant_hash, $consonants, coda)
  else
    new_syll = new_syll + "#{$cc2.sample}#{$cc1.sample}"
  end

  new_word = new_word + new_syll

  if left.length > 0
    new_word = new_word + syllable(left, :onset)
  end

  return new_word
end

def capture(word, location, letter_type)
  result = ''
  if letter_type == :consonant
    if location == :initial
      while word[/^[bcdfghjklmnpqrstvwxyz]/] != nil
        letter = word.slice!(0)
        result = result + letter
      end
    else
      num = 2
      while word[/^[bcdfghjklmnpqrstvwxyz]/] != nil && num > 0
        letter = word.slice!(0)
        result = result + letter
        num -= 1
      end
    end
  end
  if letter_type == :vowel
    while word[/^[aeiou]/] != nil
      letter = word.slice!(0)
      result = result + letter
    end
  end
  

  [result, word]
end

puts "Welcome to the faux-celtic translator"

while true
  print "Please enter the word you'd like to translate: "
  input = gets&.chomp&.downcase
  if input == "exit" || input == nil
    export([$vowel_hash, $diphthong_hash, $consonant_hash, $cc1_hash, $cc2_hash, $ccc2_hash, $ccc3_hash])
    exit
  end
  if input == 'open'
    open
  end
  trans(input)
  puts "-" * 30
end