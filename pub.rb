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
end
