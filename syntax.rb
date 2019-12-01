# frozen_string_literal: true

NOUNS = %w[cat dog flower koala pumpkin child pineapple warrior princess wagon marshall].freeze
VERBS = %w[walks talks sings flies cries laughs jumps runs falls].freeze
ARTICLES = %w[the a].freeze
ADJECTIVES = %w[orange elegant awesome].freeze
ADVERBS = %w[quickly nicely sloppily strangely oddly beautifully].freeze

def find_article(noun_phrase)
  article = ARTICLES.sample + ' '
  article = 'an ' if %w[a e i o u y].include?(noun_phrase[0]) && article == 'a '
  article
end

def find_adverb
  ADVERBS.sample
end

def find_subject
  noun_phrase = ''
  subject_phrase = ''
  # adjective?
  if rand > 0.5
    # 50% chance of an adjective
    noun_phrase += ADJECTIVES.sample + ' '
  end
  noun_phrase += NOUNS.sample

  subject_phrase += find_article(noun_phrase) + noun_phrase
end

def find_predicate
  verb_phrase = ''

  verb_phrase += VERBS.sample

  if rand > 0.5
    # 50% chance of an adjective
    verb_phrase += ' ' + find_adverb
  end

  verb_phrase
end

def find_sentence
  new_sentence = find_subject + ' ' + find_predicate + '.'
  new_sentence = new_sentence.capitalize
end

puts find_sentence
