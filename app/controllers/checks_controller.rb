class ChecksController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @check = Check.new(check_params)
    if @check.save
      flash[:notice] = "Check added!"
      redirect_to @check.trail
    else
      flash[:alert] = "Check could not be saved. #{@check.errors.full_messages}"
      redirect_to :back
    end
  end

  private

  def check_params
    params.require(:check).permit(:trail_id, :location_id, :checktype)
  end
end
