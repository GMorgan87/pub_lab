class Customer

  attr_reader :name, :cash, :age, :drinks

  def initialize(name, cash, age)
    @name = name
    @cash = cash
    @age = age
    # @drinks = []
  end

  def can_afford(drink)
    if @cash >= drink.price
      return true
    end
    return false
  end

  def pay_money(amount)
    @cash -= amount
  end

  # def get_drink(drink)
  #   @drinks.push(drink)
  # end





end
