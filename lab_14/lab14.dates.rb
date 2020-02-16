def english_date(iso_date)
  # To make the code below work, define a
  # month_names hash with "01" through "12"
  # as keys, and "January" through "December"
  # as values.

  month_names = {
    "01" => "January", "02" => "February", "03" => "March",
    "04" => "April", "05" => "May", "06" => "June",
    "07" => "July", "08" => "August", "09" => "September",
    "10" => "October", "11" => "November", "12" => "December"
  }
  date_parts = iso_date.split("-")
  year = date_parts[0]
  month = date_parts[1]
  day = date_parts[2]
  "#{month_names[month]} #{day}, #{year}"
end

# Should print "June 20, 2002"
puts english_date("2002-06-20")
# Should print "December 13, 1974"
puts english_date("1974-12-13")