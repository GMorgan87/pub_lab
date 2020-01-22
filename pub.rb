class Pub

  attr_reader :name

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def check_age(customer)
    return customer.age >= 18
  end

  def too_drunk?(customer)
    return customer.drunkenness > 20
  end

  def cash_in_till()
    return @till
  end

  def take_money(amount)
    @till += amount
  end

  def sell_drink(customer, drink)
    price = drink.price
    units = drink.units
    if customer.can_afford(drink)
      customer.pay_money(price)
      take_money(price)
      customer.get_drunk(units)
    end
  end


end
