class AnonymousUserPlansController < ApplicationController
  def show
    @anonymous_user_plan = AnonymousUserPlan.find(params[:id])
    @destinations = @anonymous_user_plan.destinations
  end
end
