class PlansController < ApplicationController
  def update
    @plan = Plan.first
    @plan.update_attributes(plan_params)
    redirect_to controller: 'maps', action: 'index'
  end

  private
    def plan_params
      params.require(:plan).permit(
        :destination1,
        :destination2,
        :destination3,
        :destination4,
        :destination5,
        :destination6,
        :destination7,
        :destination8,
        :destination9,
        :destination10
        )
    end
end
