require 'test_helper'

class DestinationTest < ActiveSupport::TestCase
  def setup
    @plan = Plan.first
    @destination = @plan.destinations.build(name: "東京駅")
  end

  test "should be valid" do
    assert @destination.valid?
  end

end
