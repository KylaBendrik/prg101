class Gigasecond
  GIGASECONDS = 1_000_000_000
  def self.from(start_time_in_seconds)
    start_time_in_seconds + GIGASECONDS
  end
end