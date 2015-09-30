class TrailsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_trail, except: [:index, :new, :create]
  before_action :correct_user, only: [:update, :destroy]

  def index
    @trails = Trail.calendar
    @trail = Trail.new
  end

  def create
    @trail = current_user.trails.new(trail_params)
    if @trail.save
      flash[:notice] = "Trail added!"
      redirect_to @trail
    else
      flash[:alert] = "Trail could not be saved. #{@trail.errors.full_messages}"
      redirect_to :back
    end
  end

  def show
    @check = @trail.checks.new
    @bar_location = BarLocation.new
    @outdoor_location = OutdoorLocation.new
    @comment = @trail.comments.new
  end

  def edit
  end

  def update
    if @trail.update_attributes(trail_params)
      flash[:notice] = "Trail updated!"
      redirect_to @trail
    else
      flash[:alert] = "Trail could not be saved. #{@trail.errors.full_messages}"
      redirect_to :back
    end
  end

  def destroy
    @trail.destroy
    flash[:alert] = "Trail deleted"
    redirect_to root_path
  end

  private

  def trail_params
    params.require(:trail).permit(:name, :start)
  end

  def set_trail
    @trail = Trail.find(params[:id])
  end

  def correct_user
    @trail = Trail.find(params[:id])
    flash[:alert] = "You aren't authorized to edit this trail"
    redirect_to @trail unless @trail.permissions(current_user)
  end
end
