class ChecksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user_create, only: [:create]
  before_action :correct_user_destroy, only: [:destroy]

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

  def destroy
    @check = Check.find(params[:id])
    @check.destroy
    flash[:alert] = "Check deleted"
    redirect_to @check.trail
  end

  private

  def check_params
    params.require(:check).permit(:trail_id, :location_id, :checktype)
  end

  def correct_user_create
    @trail = Trail.find(check_params[:trail_id])
    redirect_to root_url if @trail.user_id != current_user.id
  end

  def correct_user_destroy
    @trail = Check.find(params[:id]).trail
    redirect_to root_url unless @trail.permissions(current_user)
  end
end
