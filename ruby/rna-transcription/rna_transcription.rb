class Complement
  COMPLEMENTS = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }
  def self.of_dna(dna)
    return '' if dna.empty?

    return COMPLEMENTS[dna] if dna.length == 1

    result = ''
    dna.chars.each do |nucleotide|
      result = result + COMPLEMENTS[nucleotide]
    end
    result
  end
end
