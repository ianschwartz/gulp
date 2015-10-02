class PostsController < ApplicationController
  before_action :set_post, except: [:new, :create]
  def create
    @post = Post.new(post_params)
    @post.posttype = "text"
    @post.poster = current_user
    if @post.save
      redirect_to root_url
    else
      redirect_to new_post_path
    end
  end

  def new
    @post = current_user.posts.new
  end

  def destroy
    @post.destroy
    flash[:alert] = "Post deleted"
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Post updated!"
      redirect_to root_url
    else
      flash[:alert] = "Post could not be saved. #{@trail.errors.full_messages}"
      redirect_to :back
    end
  end

  def show
    @comment = @post.comments.new
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
