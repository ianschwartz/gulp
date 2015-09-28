class BarLocationsController < ApplicationController
  before_action :authenticate_user!

  def create
    place = build_place
    @location = Location.new(place: place)
    if @location.save
      flash[:notice] = "Location added!"
      redirect_to locations_path
    else
      flash[:alert] = "Location could not be saved. #{@location.errors.full_messages}"
      redirect_to :back
    end
  end

  private

  def build_place
    BarLocation.new(bar_location_parameters)
  end

  def bar_location_parameters
    params.require(:bar_location).permit(:name, :address, :city, :state, :latitude, :longitude)
  end
end