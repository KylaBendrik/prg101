#making parameters optional:

def order_soda(flavor, size = "medium", quantity = 1) #these "=" in the arguments are the defaults
  if quantity == 1
    plural = "soda"
  else
    plural = "sodas"
  end
  puts "#{quantity} #{size} #{flavor} #{plural}, coming right up!"
end

order_soda("orange")
order_soda("lemon-lime", "small", 2)
order_soda("grape", "large")

#