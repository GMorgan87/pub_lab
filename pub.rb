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

  def stock_count(drink)
    return @drinks[drink]
  end

  def reduce_stock_count(drink)
    @drinks[drink] -= 1
  end

  def sell_drink(customer, drink)
    price = drink.price
    units = drink.units

    if too_drunk?(customer)
      "Taxi for #{customer.name}"
      return
    end

    if customer.can_afford(drink) && check_age(customer)
      customer.pay_money(price)
      take_money(price)
      customer.get_drunk(units)
      reduce_stock_count(drink)
    end
  end

  def sell_food(customer, food)
    price = food.price
    rejuvination = food.rejuvination

    if customer.can_afford(food)
      customer.pay_money(price)
      take_money(price)
      customer.rejuvinate(rejuvination)
    end
  end

  def get_stock_value()
    total_value = 0
    for drink in @drinks
      total_value += drink[0].price * drink[1]
    end
    return total_value
  end




end
