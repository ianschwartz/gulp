class TrailsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_trail, except: [:index, :new, :create]
  before_action :correct_user, only: [:update, :destroy]

  def index
    @trails = Trail.calendar
    @trail = Trail.new
  end

  def create
    @trail = Trail.new(trail_params)
    if @trail.save
      @trail.user.posts.create(body: "#{@trail.user.name} created a new trail! #{view_context.link_to(@trail.name, @trail)}", posttype: "action")
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
    if user_signed_in? && !current_user.coming_on_trail?(@trail)
      @follow = @trail.passive_relationships.new
    elsif user_signed_in?
      @follow = current_user.active_relationships.find_by(followable_id: @trail.id)
    end
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
    params.require(:trail).permit(:name, :start, :kennel_id, :user_id, :price, :description)
  end

  def set_trail
    @trail = Trail.find(params[:id])
  end

  def correct_user
    @trail = Trail.find(params[:id])
    unless @trail.permissions(current_user)
      flash[:alert] = "You aren't authorized to edit this trail"
      redirect_to @trail
    end
  end
end
