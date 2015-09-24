class TrailsController < ApplicationController
  before_action :set_trail, except: [:index, :new, :create]

  def index
    @trails = Trail.all
  end

  def new
    @trail = Trail.new
  end

  def create
    @trail = Trail.new(trail_params)
    if @trail.save
      flash[:notice] = "Trail added!"
      redirect_to @trail
    else
      flash[:alert] = "Trail could not be saved. #{@trail.errors.full_messages}"
      redirect_to :back
    end
  end

  def show
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
end
