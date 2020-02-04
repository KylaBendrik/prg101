# frozen_string_literal: true

class Employee
  attr_reader :name

  def name=(name)
    # validate and set @name
    raise "Name can't be blank!" if name.empty?

    @name = name
  end

  def initialize(name = 'Anonymous')
    self.name = name
  end

  def print_name
    # prints name nicely
    puts "Name: #{ name }"
  end

  def print_pay_stub(formatted_pay)
    print_name
    puts "Pay This Period: #{ formatted_pay }"
  end
end

class SalariedEmployee < Employee
  attr_reader :salary
  def salary=(salary)
    # Validate and set @salary
    raise "#{ salary } is not a valid salary!" if salary.negative?

    @salary = salary
  end

  def initialize(name = 'Anonymous Salaried Employee', salary = 0.0)
    super(name)
    self.salary = salary
  end

  def print_pay_stub
    pay_for_period = ((salary / 365.0) * 14)
    formatted_pay = format('$%.2f', pay_for_period)
    
    super(formatted_pay)
  end
end

class HourlyEmployee < Employee
  # class methods first
  def self.security_guard(name)
    HourlyEmployee.new(name, 19.25, 30)
  end

  def self.cashier(name)
    HourlyEmployee.new(name, 12.75, 25)
  end

  def self.janitor(name)
    HourlyEmployee.new(name, 10.50, 20)
  end

  # attribute accesors
  attr_reader :hourly_wage, :hours_per_week

  

  def hourly_wage=(hourly_wage)
    if hourly_wage.negative?
      raise "#{ hourly_wage } is not a valid hourly wage!"
    end

    @hourly_wage = hourly_wage
  end

  def hours_per_week=(hours_per_week)
    if hours_per_week.negative?
      raise "#{ hours_per_week } is not number of hours per week!"
    end

    @hours_per_week = hours_per_week
  end

  def initialize(name = 'Anonymous Hourly Employee', hourly_wage = 0.0, hours_per_week = 0.0)
    super(name)
    self.hourly_wage = hourly_wage
    self.hours_per_week = hours_per_week
  end

  

  def print_pay_stub
    pay_for_period = hourly_wage * hours_per_week * 2
    formatted_pay = format('$%.2f', pay_for_period)
    super(formatted_pay)
  end
end

angela = HourlyEmployee.security_guard("Angela Matthews")
angela.print_pay_stub