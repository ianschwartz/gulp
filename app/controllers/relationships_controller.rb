class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @relationship = Relationship.new(relationship_params)
    @relationship.user = current_user
    if @relationship.save
      redirect_to @relationship.followable
    else
      redirect_to :back
    end
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.delete    
    redirect_to @relationship.followable
  end

  private

  def relationship_params
    params.require(:relationship).permit(:followable_id, :followable_type)
  end
end