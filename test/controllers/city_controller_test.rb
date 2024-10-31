require "test_helper"

class CityControllerTest < ActionDispatch::IntegrationTest
  test "should get cityview" do
    get city_cityview_url
    assert_response :success
  end
end
