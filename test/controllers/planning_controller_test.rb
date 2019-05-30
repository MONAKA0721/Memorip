require 'test_helper'

class PlanningControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get planning_top_url
    assert_response :success
  end

end
