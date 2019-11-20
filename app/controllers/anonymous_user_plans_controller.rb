class AnonymousUserPlansController < ApplicationController
  def show
    @anonymous_user_plan = AnonymousUserPlan.find(params[:id])
    @destinations = @anonymous_user_plan.destinations
    gon.planData = @destinations.map{|d| d.name}
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

  def edit
    @anonymous_user_plan = AnonymousUserPlan.find(params[:id])
    gon.planData = @anonymous_user_plan.destinations.map{|d| d.name}
  end

  def update
    @anonymous_user_plan = AnonymousUserPlan.find(params[:id])
    if @anonymous_user_plan.update_attributes(plan_params)
      flash[:success] = "プランが更新されました"
      redirect_to edit_anonymous_user_plan_url
    else
      flash[:danger] = "タイトルを入力してください"
      redirect_to edit_anonymous_user_plan_url
    end
  end

  private
    def plan_params
      params.require(:anonymous_user_plan).permit(
        :title,
        :picture,
        destinations_attributes: [:id, :time, :name, :_destroy, :picture]
      )
    end
end
