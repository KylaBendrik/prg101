class Movie
  attr_accessor :title, :director, :year, :id
  def initialize(title, director = "", year = "")
    @title = title
    @director = director
    @year = year    
  end
end