require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../food')

class TestFood < Minitest::Test

  def setup
    @food1 = Food.new("Cheese Burger", 5, 3)
  end

  def test_get_name
    assert_equal("Cheese Burger", @food1.name)
  end

  def test_get_price
    assert_equal(5, @food1.price)
  end

  def test_get_rejuvination
    assert_equal(3, @food1.rejuvination)
  end

end
