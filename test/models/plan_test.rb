require 'test_helper'

class PlanTest < ActiveSupport::TestCase

  def setup
    @user = User.first
    @plan = Plan.new(title:"奈良旅行", user_id: @user.id)
  end

  test "associated destinations should be destroyed" do
    @plan.save
    @plan.destinations.create!(name: "JR奈良駅")
    assert_difference 'Destination.count', -1 do
      @plan.destroy
    end
  end
end
