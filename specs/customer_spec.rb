require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer')
require_relative('../drink')

class TestCustomer < Minitest::Test

  def setup
    @customer1 = Customer.new("Gareth", 100, 32)
    @customer2 = Customer.new("Alan", 80, 16)
    @drink = Drink.new("Tenents", 3, 2)
  end

  def test_get_name
    assert_equal("Gareth", @customer1.name())
  end

  def test_get_cash
    assert_equal(100, @customer1.cash())
  end

  def test_get_age
    assert_equal(32, @customer1.age())
  end

  def test_can_afford__true
    assert_equal(true, @customer1.can_afford(@drink))
  end

  def test_can_afford__false
    @drink2 = Drink.new("Tenents", 103, 2)
    assert_equal(false, @customer1.can_afford(@drink2))
  end

  def test_pay_money
    @customer1.pay_money(20)
    assert_equal(80, @customer1.cash)
  end

  def test_get_drink
    @customer1.get_drunk(2)
    assert_equal(2, @customer1.drunkenness)
  end

  def test_rejuvinate
    @customer1.rejuvinate(2)
    assert_equal(-2, @customer1.drunkenness)
  end



end
