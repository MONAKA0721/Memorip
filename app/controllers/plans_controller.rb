class PlansController < ApplicationController
  def index
    @plans = Plan.all.paginate(page: params[:page])
  end

  def update
    @plan = Plan.find(params[:id])
    @plan.update_attributes(plan_params)
    redirect_to controller: 'plans', action: 'edit'
  end

  def edit
    if params[:markerName]
      gon.markerName = params[:markerName]
    end
    if params[:markerData]
      gon.Data = params[:markerData]
    else
      gon.Data =[
           {name: 'TAM 東京',
           lat: 35.6954806,
            lng: 139.76325010000005
          }
        ]
    end

    @plan = Plan.find(params[:id])
    gon.planData = [
      @plan.destination1,
      @plan.destination2,
      @plan.destination3,
      @plan.destination4,
      @plan.destination5,
      @plan.destination6,
      @plan.destination7,
      @plan.destination8,
      @plan.destination9,
      @plan.destination10
    ]
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to controller: 'plans', action: 'index'
    end
  end

  def new
    @plan = Plan.new
  end

  private
    def plan_params
      params.require(:plan).permit(
        :title,
        :destination1,
        :destination2,
        :destination3,
        :destination4,
        :destination5,
        :destination6,
        :destination7,
        :destination8,
        :destination9,
        :destination1time,
        :destination2time,
        :destination3time,
        :destination4time,
        :destination5time,
        :destination6time,
        :destination7time,
        :destination8time,
        :destination9time,
        :destination10time
      )
    end
end
