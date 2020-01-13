class Norn
  def initialize
    @age = 0
    @female = ([0, 1].sample == 0)
    @vocabulary = {
      'mommy' => generate_word('mommy'),
      'eat' => generate_word('eat'),
    }
  end
  def display
    gender_display = ''
    if @female
      gender_display = 'female'
    else
      gender_display = 'male'
    end
    puts "#{gender_display}: #{@age}"
  end
  def speak
    saying = 'mommy'
    puts @vocabulary[saying]
    input = gets.chomp
    unless input.empty?
      learn(input, saying)
      speak
    end
  end
  def learn(input, saying)
    new_letter = (rand(1..saying.length) - 1)
    puts "learning #{new_letter}"
    @vocabulary[saying][new_letter] = input[new_letter]
  end
  private
  def generate_word(meaning)
    letters = %w[b c d f g h j k l m n p q r s t v w x z a e i o u y]
    vowels = %w[a e i o u y]
    i = 0
    result = ''
    meaning.length.times do
      
      if i == meaning.length - 2
        result = result + (vowels.sample)
      else
        result = result + (letters.sample)
      end
      i += 1
    end
    result
  end
end

new_norn = Norn.new
new_norn.display
new_norn.speak