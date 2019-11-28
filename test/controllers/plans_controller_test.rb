require 'test_helper'

class PlansControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @plan = plans(:one)
  end
end
