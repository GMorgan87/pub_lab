class Customer

  attr_reader :name, :cash, :age

  def initialize(name, cash, age)
    @name = name
    @cash = cash
    @age = age
  end

  def can_afford(drink)
    if @cash >= drink.price
      return true
    end
    return false
  end

end
