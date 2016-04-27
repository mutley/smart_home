require './test/test_helper'

class SmartHomeLightTest < Minitest::Test

  def test_it_returns_status_of_light
    VCR.use_cassette('test_light') do
      light = SmartHome::Light.find(1)
      assert_equal SmartHome::Light, light.class

      assert_equal 1, light.id
      assert_equal 50, light.strength
    end 
  end

  def test_it_returns_all_lights
		VCR.use_cassette('all_lights') do
      result = SmartHome::Light.all

      # Make sure we got all the lights
      assert_equal 2, result.length

      # Make sure that the JSON was parsed
      assert result.kind_of?(Array)
      assert result.first.kind_of?(SmartHome::Light)
    end
	end

end
