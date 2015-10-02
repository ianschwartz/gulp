class DashboardController < ApplicationController
  def show
    if user_signed_in?
      @post = current_user.posts.new
    end
  end
end
