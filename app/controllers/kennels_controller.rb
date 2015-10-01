class KennelsController < ApplicationController
  def index
    @kennels = Kennel.all
  end

  def show
    @kennel = Kennel.find(params[:id])
    @trails = @kennel.trails.calendar
    @trail = @kennel.trails.new
  end
end
