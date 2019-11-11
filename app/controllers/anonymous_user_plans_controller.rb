class AnonymousUserPlansController < ApplicationController
  def show
    @anonymous_user_plan = AnonymousUserPlan.find(params[:id])
    @destinations = @anonymous_user_plan.destinations
  end

  def new
    @anonymous_user_plan = AnonymousUserPlan.new
    10.times { @anonymous_user_plan.destinations.build }
  end

  def create
    @anonymous_user_plan = AnonymousUserPlan.new(plan_params)
    if @anonymous_user_plan.save
      redirect_to controller: 'anonymous_user_plans', action: 'show', id: @anonymous_user_plan.id
    else
      flash[:danger] = "タイトルを入力してください"
      redirect_to acition: 'new'
    end
  end

  private
    def plan_params
      params.require(:anonymous_user_plan).permit(
        :title,
        :picture,
        destinations_attributes: [:id, :time, :name, :_destroy]
      )
    end
end
