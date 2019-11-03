class PlansController < ApplicationController
  def index
    @plans = Plan.all.paginate(page: params[:page])
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
  end

  def show
    @plan = Plan.find(params[:id])
    @destinations = @plan.destinations
  end

  def create
    @plan = Plan.new(plan_params)
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

  private
    def plan_params
      params.require(:plan).permit(
        :title,
        destinations_attributes: [:id, :time, :name, :_destroy]
      )
    end
end
