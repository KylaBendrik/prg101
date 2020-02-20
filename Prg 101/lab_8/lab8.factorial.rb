class Integer
  def factorial
    num = 1
    total = 1
    self.times do 
      total = total * num
      num += 1
    end
    total
  end
end

5.factorial