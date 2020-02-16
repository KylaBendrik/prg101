# frozen_string_literal: true

class Candidate
  attr_accessor :name, :age, :occupation, :hobby, :birthplace
  def initialize(name, age:, occupation:, hobby: nil, birthplace: 'Sleepy Creek')
    self.name = name
    self.age = age
    self.occupation = occupation
    self.hobby = hobby
    self.birthplace = birthplace
  end
end

candidate = Candidate.new('Elizabeth Jackson')

pp candidate
