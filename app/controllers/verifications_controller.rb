class VerificationsController < ApplicationController
  def create
    if current_user.verified?
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
    else
      flash[:alert] = "You must be verified, to verify."
      redirect_to :back
    end
  end
end
