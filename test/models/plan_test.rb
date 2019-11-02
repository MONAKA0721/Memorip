require 'test_helper'

class PlanTest < ActiveSupport::TestCase

  def setup
    @plan = Plan.new(title:"奈良旅行")
  end

  test "associated destinations should be destroyed" do
    @plan.save
    @plan.destinations.create!(name: "東京駅")
    assert_difference 'Destination.count', -1 do
      @plan.destroy
    end
  end
end
