class ResistorColorDuo
  BANDS = %w[black brown red orange yellow green blue violet grey white].freeze

  def self.value(input)
    (BANDS.index(input[0]) * 10) + (BANDS.index(input[1]))
  end
end

