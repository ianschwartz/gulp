class KennelsController < ApplicationController
  def index
    @kennels = Kennel.all
  end

  def show
    @kennel = Kennel.find(params[:id])
    @trails = @kennel.trails.calendar
    @trail = @kennel.trails.new
    if !current_user.following?(@kennel)
      @follow = @kennel.passive_relationships.new
    else
      @follow = current_user.active_relationships.find_by(followable_id: @kennel.id)
    end
  end
end
