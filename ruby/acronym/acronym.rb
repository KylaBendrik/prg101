class Acronym
  def self.abbreviate(phrase)
    phrase_array = phrase.split(/\W/)
    phrase_array -= [""]
    acronym = phrase_array.reduce("") do |memo, word|
      memo = memo + word.chars.first.upcase
    end
  end
end