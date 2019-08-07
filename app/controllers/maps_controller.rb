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
     # }, {
     #        name: '小川町駅',
     #     lat: 35.6951212,
     #        lng: 139.76610649999998
     # }, {
     #        name: '淡路町駅',
     #     lat: 35.69496,
     #      lng: 139.76746000000003
     # }, {
     #        name: '御茶ノ水駅',
     #        lat: 35.6993529,
     #        lng: 139.76526949999993
     # }, {
     #        name: '神保町駅',
     #     lat: 35.695932,
     #     lng: 139.75762699999996
     # }, {
     #        name: '新御茶ノ水駅',
     #       lat: 35.696932,
     #     lng: 139.76543200000003
     # }
    end

    @plan = Plan.first
  end
end
