class LocationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_location, except: [:index, :new, :create]

  def index
    if params[:search].present?
      @locations = (BarLocation.near(params[:search], params[:distance || 2]) + OutdoorLocation.near(params[:search], params[:distance || 2]))
    else
      @locations = BarLocation.all + OutdoorLocation.all
    end

    @bar_location = BarLocation.new
    @outdoor_location = OutdoorLocation.new
  end

  def new
    @location = Location.new
  end

  def show
    if @location.place_type == 'BarLocation'
      @bar_location = BarLocation.find(@location.place_id)
    else
      @outdoor_location = OutdoorLocation.find(@location.place_id)
    end
    @comment = @location.comments.new
  end

  def edit
  end

  def update
    if @location.update_attributes(location_params)
      flash[:notice] = "Location updated!"
      redirect_to @location
    else
      flash[:alert] = "Location could not be saved. #{@location.errors.full_messages}"
      redirect_to :back
    end
  end

  def destroy
    @location.place.destroy
    @location.destroy
    flash[:alert] = "Location deleted"
    redirect_to root_path
  end

  private

  def location_params
    params.require(:location).permit(:name, :address, :city, :state, :latitude, :longitude)
  end

  def set_location
    @location = Location.find(params[:id])
  end
end
