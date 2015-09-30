class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @comment.commentable
    else
      flash[:alert] = @comment.errors
      redirect_to :back
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      flash[:notice] = "Comment updated!"
      redirect_to @comment.commentable
    else
      flash[:alert] = "Comment could not be saved. #{@comment.errors.full_messages}"
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.delete
      flash[:alert] = "Comment Deleted"
      redirect_to @comment.commentable
    else
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :user_id)
  end
end
