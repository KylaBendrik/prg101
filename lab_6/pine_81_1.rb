# frozen_string_literal: true

ONES = {
  1 => 'one',
  2 => 'two',   3 => 'three',
  4 => 'four',  5 => 'five',
  6 => 'six',   7 => 'seven',
  8 => 'eight', 9 => 'nine'
}.freeze

TEENS = {
  10 => 'ten',       11 => 'eleven',
  12 => 'twelve',    13 => 'thirteen',
  14 => 'fourteen',  15 => 'fifteen',
  16 => 'sixteen',   17 => 'seventeen',
  18 => 'eighteen',  19 => 'nineteen'
}.freeze

TENS = {
  20 => 'twenty',    30 => 'thirty',
  40 => 'fourty',    50 => 'fifty',
  60 => 'sixty',     70 => 'seventy',
  80 => 'eighty',    90 => 'ninety'
}.freeze

THOUSANDS = {
  0 => '',
  1 => 'thousand',
  2 => 'million',
  3 => 'billion',
  4 => 'trillion',
  5 => 'quadrillion',
  6 => 'quintllion',
  7 => 'sextillion'
}.freeze

def anglicize(num)
  return 'zero' if num == 0

  # returns english words for the number put in.
  chunks = find_chunks(num)
  t = 0
  english = ''

  chunks.each do |chunk|
    comma = " #{THOUSANDS[t]}, "

    comma = '' if t == 0

    chunk_words = find_chunk_words(chunk)

    english = chunk_words.to_s + comma + english
    t += 1
  end

  english
end

def find_chunk_words(num)
  words = ''
  words = ONES[((num - (num % 100)) / 100)] + ' hundred' if num > 99

  left = num % 100

  if left < 20 && left > 9
    words = words + add_space(words) + TEENS[left]
  elsif left > 19
    words = words + add_space(words) + TENS[(left - (left % 10))]
    left = left % 10
    words = words + '-' + ONES[left] if left > 0
  elsif left < 10
    words = words + add_space(words) + ONES[left]
  end

  words
end

def add_space(words)
  space = ''
  space = ' ' unless words == ''
  space
end

def find_chunks(num)
  # we want to be able to go up to 999 trillion (999,000,000,000,000)
  chunks = []
  left = num

  while left > 0
    r = left % 1000
    chunks.push(r)
    left = (left - r) / 1000
  end
  # return array of 000 chunks
  chunks
end
