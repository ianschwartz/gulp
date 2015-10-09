class VerificationsController < ApplicationController
  def create
    @user = User.find(params[:id])
    @verification = @user.verifications.new
    @verification.verifier = current_user
    if @verification.save
      flash[:alert] = "Awesome!"
      redirect_to @user
    else
      flash[:alert] = "You've already done that."
      redirect_to @user
    end
  end
end
