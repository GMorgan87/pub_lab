require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../drink')
require_relative('../customer')

class TestPub < Minitest::Test

  def setup
    @customer1 = Customer.new("Gareth", 100, 32)
    @customer2 = Customer.new("Alan", 80, 16)

    @drink1 = Drink.new("Tenents", 3, 2)
    @drink2 = Drink.new("Jura", 4, 5)
    @drink3 = Drink.new("Moet", 5, 4)

    @drinks = [@drink1, @drink2, @drink3]

    @pub = Pub.new("Chanter", 1000, @drinks)
  end

  def test_get_name
    assert_equal("Chanter", @pub.name)
  end

  def test_check_age__true
    assert_equal(true, @pub.check_age(@customer1))
  end

  def test_check_age__false
    assert_equal(false, @pub.check_age(@customer2))
  end

  def test_cash_in_till
    assert_equal(1000, @pub.cash_in_till())
  end

  def test_take_money
    @pub.take_money(3)
    assert_equal(1003, @pub.cash_in_till())
  end

  def test_sell_drink
    @pub.sell_drink(@customer1, @drink1)
    assert_equal(1003, @pub.cash_in_till())
    assert_equal(97, @customer1.cash)
  end




end
