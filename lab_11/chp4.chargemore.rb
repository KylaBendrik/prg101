# frozen_string_literal: true

class Employee
  attr_reader :name, :salary
  def name=(name)
    raise "Name can't be blank!" if name.empty?

    @name = name
  end

  def salary=(salary)
    raise "A salary of #{ salary } isn't valid!" if salary.negative?

    @salary = salary
  end

  def print_pay_stub
    puts "Name: #{ @name }"
    pay_for_period = (@salary / 365) * 14
    puts "Pay This Period: $#{ pay_for_period }"
  end
end
