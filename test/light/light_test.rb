require './test/test_helper'

class SmartHomeLightTest < Minitest::Test
  def test_it_returns_status_of_light
    VCR.use_cassette('one_light') do
      light = SmartHome::Light.find(68)
      assert_equal SmartHome::Light, light.class

      assert_equal 1, light.id
      assert_equal 50, light.strength
    end 
  end
end