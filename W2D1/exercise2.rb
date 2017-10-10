class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @bonus = @salary * multiplier
  end

end

class Manager < Employee
  # extend Employee
  attr_reader :subs # alias subordinates

  def initialize(name, title, salary, boss, subs = [])
    super
    @subs = subs
  end

  def bonus(multiplier)

    return @salary * multiplier if subs.empty?
    # TODO correct logic?
    total = @subs.reduce(0) do |acc, emp|
      # recursive call
      acc += emp.bonus(multiplier) unless emp.subs.empty?
      acc += emp.salary if emp.subs.empty?
    end

    @bonus = total * multiplier
  end

end

# if __FILE__ == $PROGRAM_NAME
  ned    = Employee.new("Ned", "Founder", 1000000, nil)
  darren = Employee.new("Darren", "Manager", 78000, ned)
  shawna = Employee.new("Shawna", "TA", 12000, darren)
  david  = Employee.new("Shawna", "TA", 10000, darren)
# end
