require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup
    @like = Like.new(user_id: User.first.id, plan_id: Plan.first.id)
  end

  test "should be valid" do
    assert @like.valid?
  end

  test "should require a user_id" do
    @like.user_id = nil
    assert_not @like.valid?
  end

  test "should require a plan_id" do
    @like.plan_id = nil
    assert_not @like.valid?
  end
end
