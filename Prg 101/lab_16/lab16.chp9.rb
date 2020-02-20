# frozen_string_literal: true

module AcceptsComments
  def comments
    @comments || @comments = []
  end

  def add_comment(comment)
    comments << comment
  end
end

class Clip
  include AcceptsComments
  def play
    puts "Playing #{ object_id }"
  end
end

class Video < Clip
  attr_accessor :resolution
end

class Song < Clip
  attr_accessor :beats_per_minute
end

class Photo
  include AcceptsComments
  def show
    puts "Displaying #{ object_id }"
  end
end

video = Video.new
video.add_comment('Cool slow motion effect!')
video.add_comment('Weird ending.')
song = Song.new
song.add_comment('Awesome beat.')

p video.comments, song.comments
