require 'test_helper'

class PlansEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @plan = plans(:one)
  end

  test "should build destinations" do
    log_in_as(@user)
    get edit_plan_path(@plan)
    assert_template 'plans/edit'
    patch plan_path(@plan), params:{ plan: { title: "テスト" } }
    assert_equal 10, @plan.destinations.count
  end
end
