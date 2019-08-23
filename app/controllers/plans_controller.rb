class PlansController < ApplicationController
  def update
    @plan = Plan.first
    @plan.update_attributes(plan_params)
    redirect_to controller: 'maps', action: 'index'
  end

  private
    def plan_params
      params.require(:plan).permit(:destination2, :destination5)
    end
end
