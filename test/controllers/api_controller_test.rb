require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get monsters" do
    get api_monsters_url
    assert_response :success
  end

end
