class Book
  attr_accessor :chapters, :last_page
  def initialize
    @chapters = []
    @last_page = 0
  end
  def new_chapter(new_title)
    @last_page += rand(0..(chapters.length*4))
    @chapters.push Chapter.new(new_title, @last_page, (@chapters.length + 1))
  end
end

class Chapter
  attr_accessor :num, :title, :page
  def initialize(new_title, new_page, length)
    @num = length
    @title = new_title
    @page = new_page
  end
end

book = Book.new

chapter_titles = [
  "Hello World",
  "Bonjour le Monde",
  "Witaj Swiecie",
  "Pershendetje Bote",
  "Dia duit ar domhan"
]

chapter_titles.each{|chap_title|
book.new_chapter(chap_title)
}

puts "Table of Contents".center(60)
book.chapters.each {|this_chapter|
  puts "Chapter #{this_chapter.num}:    #{this_chapter.title}".ljust(40) + ("page ".ljust(4) + "#{this_chapter.page}".rjust(3))
}
