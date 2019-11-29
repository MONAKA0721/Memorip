require 'test_helper'

class PlansPlanupTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @plan = plans(:one)
    @destination = destinations(:one)
  end

  test "valid plan create" do
    get planup_path
    assert_difference 'Plan.count', 1 do
      post plans_path, params: { plan:{
          title: "テスト" ,
          published: true,
          id:30
      }}
    end
  end
end
