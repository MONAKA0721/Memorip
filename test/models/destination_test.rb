require 'test_helper'

class DestinationTest < ActiveSupport::TestCase
  def setup
    @plan = Plan.first
    @destination = @plan.destinations.build(name: "東京駅")
  end

  test "should be valid" do
    assert @destination.valid?
  end

  # test "plan id should be present" do
  #   @destination.plan_id = nil
  #   assert_not @destination.valid?
  # end
  
  test "name should be present" do
    @destination.name = "   "
    assert_not @destination.valid?
  end
end
