class Year
  def self.leap?(year)
    if ((year % 4).zero? && (year % 400).zero?) || ((year % 4).zero? && year % 100 != 0)
      true
    else
      false
    end
  end
end
