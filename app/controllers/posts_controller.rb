class PostsController < ApplicationController
  before_action :topic, only: [:new, :create]
  before_action :user, only: [:edit, :update, :destroy]

  def topic
    if !Topic.find_by_id(params[:topic_id])
      redirect_to root_url
    end
  end

  def user
    @post = Post.find(params[:id])
    if !current_user == @post.user
      redirect_to post_path(@post.post_id)
    end
  end

  def show
    @post = Post.find(params[:id])
    if !current_user && @post.logged
      redirect_to new_user_registration_path
    end

    if @post.views == nil
      @post.views = 0
    end
    @post.views += 1
    @post.save

    @comments = @post.comments.page(params[:page]).per(10)
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.new(posts_params)
    @post.topic_id = params[:topic_id]

    if current_user.is_admin?
      @post.comments.first.user_id = @post.user_id
    else
      @post.comments.first.user_id = current_user.id
      @post.user_id = current_user.id
      @post.featured = false
    end

    if @post.save
      redirect_to post_path(@post.id)
    else
      render 'new'
    end
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    1.times do
      comment = @post.comments.build
    end
  end

private
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(posts_params)
      redirect_to post_path(@post.id)
    else
      render 'edit'
    end
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to root_url
  end

  private
  def posts_params
    params.require(:post).permit(:name, :featured, :topic_id, :user_id, comments_attributes: [:content])
  end
end
