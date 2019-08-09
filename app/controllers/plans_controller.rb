class PlansController < ApplicationController
  def update
    @plan = Plan.first
    @plan.update_attributes(destination2: params[:plan][:destination2])
  end
end
