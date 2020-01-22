def paragraph(string)
  "<p>#{string}</p>"
end

def image(src, width = 100, height = 100)
  "<img src='#{src}', width='#{width}', height='#{height}>"
end

par1 = "Four score and seven years ago our fathers brought forth on this continent a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal."

par2 = "Now we are engaged in a great civil war, testing whether that nation or any nation so conceived and so dedicated, can long endure. We are met on a great battle-field of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this."

puts image('gettysburg.jpg', 400, 200)
puts paragraph(par1)
puts image('lincoln.png')
puts paragraph(par2)