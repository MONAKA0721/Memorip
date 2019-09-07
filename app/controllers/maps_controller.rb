class MapsController < ApplicationController
  def index
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

    @plan = Plan.first
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
end
