class SosError < StandardError
end

def send_sos
  raise SosError, "Latitude -50.75, Longitude 166.04"
end

begin
  send_sos
rescue SosError => error
  puts "Sending search party to #{error.message}"
end