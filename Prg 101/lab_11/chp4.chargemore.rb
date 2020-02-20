# frozen_string_literal: true

class Employee
  attr_reader :name, :salary
  def initialize(name = 'Anonymous', salary = 0.0)
    self.name = name
    self.salary = salary
  end

  def name=(name)
    raise "Name can't be blank!" if name.empty?

    @name = name
  end

  def salary=(salary)
    raise "A salary of #{ salary } isn't valid!" if salary.negative?

    @salary = salary
  end

  def print_pay_stub
    puts "Name: #{ name }"
    pay_for_period = format('%.2f', (salary / 365.0) * 14.0)

    puts "Pay This Period: $#{ pay_for_period }"
  end
end

amy = Employee.new('Amy Blake', 100_000)
amy.print_pay_stub
