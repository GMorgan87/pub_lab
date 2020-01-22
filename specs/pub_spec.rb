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

    @drink1 = Drink.new("Tenents", 3)
    @drink2 = Drink.new("Jura", 4)
    @drink3 = Drink.new("Moet", 5)

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

end
