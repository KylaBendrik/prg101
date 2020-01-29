# frozen_string_literal: true

# these hashes are English - Scottish Gaelic by frequecy

FINAL = {
  'c' => 'p',  'b' => 'c',  'p' => 'y',
  'a' => 'b',  'k' => 'u',  'm' => 'g',
  'w' => 'i',  'g' => 'm',  'u' => 'u',
  'l' => 'l',  'f' => 't',  'h' => 'a',
  'o' => 'o',  'n' => 'e',  'r' => 'd',
  'd' => 'r',  'y' => 's',  't' => 'n',
  's' => 'a',  'e' => 'h'
}.freeze

INITIAL = {
  'l' => 'a',  't' => 'a',  'b' => 'b',
  'a' => 'c',  's' => 'd',  'r' => 'e',
  'f' => 'f',  'o' => 'g',  'y' => 'h',
  'h' => 'i',  'i' => 'l',  'm' => 'm',
  'n' => 'n',  'p' => 'o',  'u' => 'p',
  'c' => 'r',  'd' => 's',  'w' => 't',
  'g' => 'u',  'q' => 'w',  'v' => 'y',
  'e' => 'f'
}.freeze

SINGLE = {
  'u' => 'o',  'a' => 'e',  'i' => 'u',
  'o' => 'i',  'e' => 'a',  'z' => 'q',
  'x' => 'w',  'q' => 'k',  'k' => 'y',
  'p' => 'p',  'v' => 'g',  'c' => 'f',
  'g' => 'm',  'm' => 'b',  'b' => 'g',
  'f' => 'i',  'y' => 'l',  'w' => 'c',
  'd' => 't',  'l' => 'a',  'r' => 's',
  'n' => 'r',  'h' => 'd',  's' => 'n',
  't' => 'h'
}

def translate(word)
  new_word = word
  puts word + " => " + new_word
end

translate('cat')
translate('than')
translate('that')
translate('rose')
translate('scottish')
translate('king')
