require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../drink')

class TestPub < Minitest::Test

  def setup

    @drink1 = Drink.new("Tenents", 3)
    @drink2 = Drink.new("Jura", 4)
    @drink3 = Drink.new("Moet", 5)

    @drinks = [@drink1, @drink2, @drink3]

    @pub = Pub.new("Chanter", 1000, @drinks)
  end

  def test_get_name
    assert_equal("Chanter", @pub.name)
  end

end
