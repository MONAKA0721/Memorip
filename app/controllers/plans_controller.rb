class PlansController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :update, :new, :clone]

  def index
    @plans = Plan.where(published: true).paginate(page: params[:page])
    @anonymousUserPlans = AnonymousUserPlan.all
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update_attributes(plan_params)
      flash[:success] = "プランが更新されました"
      redirect_to edit_plan_url
    else
      flash[:danger] = "タイトルを入力してください"
      redirect_to edit_plan_url
    end
  end

  def edit
    @plan = Plan.find(params[:id])
    gon.planData = @plan.destinations.map{|d| d.name}
    count = 10 - @plan.destinations.count
    count.times { @plan.destinations.build }
  end

  def show
    @plan = Plan.find(params[:id])
    @destinations = @plan.destinations
    gon.planData = @destinations.map{|d| d.name}
  end

  def create
    @plan = current_user.plans.build(plan_params)
    if @plan.save
      redirect_to controller: 'plans', action: 'show', id: @plan.id
    else
      flash[:danger] = "タイトルを入力してください"
      redirect_to acition: 'new'
    end
  end

  def new
    @plan = Plan.new
    10.times { @plan.destinations.build }
  end

  def clone
    @old_plan = Plan.find(params[:id])
    if current_user?(@old_plan.user)
      redirect_to edit_plan_url(@old_plan), flash:{id: @old_plan.id}
      flash.discard(:id) 
    else
      if params[:is_anonymous]
        p = AnonymousUserPlan.find(params[:id]).amoeba_dup
      else
        p = Plan.find(params[:id]).amoeba_dup
      end
      @plan = Plan.new(title:p.title, destinations: p.destinations)
      gon.planData = @plan.destinations.map{|d| d.name}
      count = 10 - @plan.destinations.count
      count.times { @plan.destinations.build }
    end
  end

  private
    def plan_params
      params.require(:plan).permit(
        :title,
        :picture,
        :user_id,
        :published,
        destinations_attributes: [:id, :time, :name, :_destroy, :picture, :description]
      )
    end
end
