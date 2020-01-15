VOWELS_EXPLAINED = {
  'cat' => 'a',
  'father' => 'à',
  'get' => 'e',
  'tin' => 'i',
  'evil' => 'ì',
  'top' => 'o',
  'go' => 'ó',
  'brute' => 'u'
}

VOWELS = %w[a à e i ì o ó u]

DIPHTHONGS = %w[ei ai ui eu ue au ia]

CONSONANTS = %w[p t k f v s sh x m n gn ng lj j r rr]

CC1 = %w[p t k m n f v s sh rr]
CC2 = %w[l r s]

CCC2 = %w[p t k f]
CCC3 = %w[j r l m n ng gn]

# more sonorous are more internal
# most son to least son >>>
# [j] >> [r] >> [l] >> [m n ng gn] >> [f s sh x] >> [p t k]

# ɲ = gn or ñ
# ʎ = ll in million - similar to lj
def pick_letter(set, original)
  #return a specific one for whatever you get. Get a consistent result!
  return set.sample
end

def trans(english_word)
  syllable(english_word, :initial)
end

def syllable(eng_word, location)
  onset, left = capture(eng_word, location, :consonant)
  onset_length = onset.length

  new_syll = ''
  new_word = ''

  if onset_length == 0
    
  elsif onset_length == 1
    new_syll = new_syll + pick_letter(CONSONANTS, onset)
  elsif onset_length >= 3 && location == :initial
    new_syll = new_syll + "s#{CCC2.sample}#{CCC3.sample}"
  else
    new_syll = new_syll + "#{CC1.sample}#{CC2.sample}"
  end

  vowel, left = capture(left, :vowel, :vowel)
  if vowel.length == 1
    new_syll = new_syll + pick_letter(VOWELS, vowel)
  else
    new_syll = new_syll + pick_letter(DIPHTHONGS, vowel)
  end

  coda, left = capture(left, :coda, :consonant)

  if coda.length == 0
    # do nothing
  elsif coda.length == 1
    new_syll = new_syll + pick_letter(CONSONANTS, coda)
  else
    new_syll = new_syll + "#{CC2.sample}#{CC1.sample}"
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

puts trans('absolute')
puts trans('cat')
puts trans('then')
puts trans('shrill')