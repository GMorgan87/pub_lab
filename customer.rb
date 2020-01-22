class Customer

  attr_reader :name, :cash, :age, :drunkenness

  def initialize(name, cash, age)
    @name = name
    @cash = cash
    @age = age
    @drunkenness = 0
  end

  def can_afford(item)
    if @cash >= item.price
      return true
    end
    return false
  end

  def pay_money(amount)
    @cash -= amount
  end

  def get_drunk(units)
    @drunkenness += units
  end

  def rejuvinate(units)
    @drunkenness -= units
  end






end
