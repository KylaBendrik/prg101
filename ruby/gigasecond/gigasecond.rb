class Gigasecond
  GIGASECONDS = 1_000_000_000
  def self.from(seconds)
    seconds + GIGASECONDS
  end
end