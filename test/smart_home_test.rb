require 'test_helper'

class SmartHomeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SmartHome::VERSION
  end

  def test_exists
    assert SmartHome::Light
  end
end
