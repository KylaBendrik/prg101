# frozen_string_literal: true

class TwoFer
  def self.two_fer(name = 'you')
    'One for %<name>s, one for me.' % {name: name}
  end
end
