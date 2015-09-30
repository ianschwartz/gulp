class DashboardController < ApplicationController
  def show
    if !user_signed_in?
      @trails = Trail.upcoming
    else
      @trails = current_user.feed
    end
    @next = @trails.last
  end
end
