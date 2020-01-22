require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../drink')
require_relative('../customer')
require_relative('../food')

class TestPub < Minitest::Test

  def setup
    @customer1 = Customer.new("Gareth", 100, 32)
    @customer2 = Customer.new("Alan", 80, 16)

    @drink1 = Drink.new("Tenents", 3, 2)
    @drink2 = Drink.new("Jura", 4, 5)
    @drink3 = Drink.new("Moet", 5, 4)
    @drink4 = Drink.new("Jura", 4, 22)

    @drinks = {@drink1 => 5,
               @drink2 => 5,
               @drink3 => 5,
               @drink4 => 5
             }

    @pub = Pub.new("Chanter", 1000, @drinks)

    @food1 = Food.new("Cheese Burger", 5, 3)
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
    assert_equal(2, @customer1.drunkenness)
    assert_equal(4, @pub.stock_count(@drink1))
  end

  def test_too_drunk__true
    @pub.sell_drink(@customer1, @drink4)
    assert_equal(true, @pub.too_drunk?(@customer1))
  end

  def test_too_drunk__false
    @pub.sell_drink(@customer1, @drink1)
    assert_equal(false, @pub.too_drunk?(@customer1))
  end

  def test_sell_food
    @pub.sell_food(@customer1, @food1)
    assert_equal(1005, @pub.cash_in_till())
    assert_equal(95, @customer1.cash)
    assert_equal(-3, @customer1.drunkenness)
  end

  def test_get_stock_count
    assert_equal(5, @pub.stock_count(@drink1))
  end

  def test_reduce_stock_count
    @pub.reduce_stock_count(@drink1)
    assert_equal(4, @pub.stock_count(@drink1))
  end

  # def test_drink_stock_value
  #   assert_equal(15, @pub.get_drink_stock_value(@drink1))
  # end

  def test_get_stock_value
    assert_equal(80, @pub.get_stock_value)
  end



end
