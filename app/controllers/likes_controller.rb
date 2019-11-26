class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @plan = Plan.find(params[:plan_id])
    current_user.like(@plan)
    respond_to do |format|
      format.html { redirect_to @plan }
      format.js
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    current_user.unlike(@plan)
    respond_to do |format|
      format.html { redirect_to @plan }
      format.js
    end
  end
end
