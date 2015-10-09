class UsersController < ApplicationController
  before_action :set_user
  
  def show
    if !current_user.following?(@user)
      @follow = @user.passive_relationships.new
    else
      @follow = current_user.active_relationships.find_by(followable_id: @user.id)
    end
  end

  def following
  end

  def followers
  end

  def verify
    current_user.verify(@user)
    @user.save
    redirect_to :back
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
