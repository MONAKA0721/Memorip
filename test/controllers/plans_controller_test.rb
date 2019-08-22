require 'test_helper'

class PlansControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get plans_update_url
    assert_response :success
  end

end
