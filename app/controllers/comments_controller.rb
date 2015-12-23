class CommentsController < ApplicationController
  before_action :logged
  before_action :post, only: [:new, :create]
  before_action :mycomment, only: [:edit, :update, :destroy]

  def logged
    if !current_user
      redirect_to new_user_session_path
    end
  end

  def mycomment
    @comment = Comment.find(params[:id])
    unless current_user == @comment.user
      redirect_to post_path(@comment.post_id)
    end
    # if current_user.block:
    #   redirect_to post_path(@comment.post_id)
    # end
  end

  def post
    if !Post.find_by_id(params[:post_id])
      redirect_to root_url
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comments_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to post_path(@comment.post_id)
    else
      render 'new'
    end
  end

  def new
    @comment = Comment.new
    @post_id = params[:post_id]
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comments_params)
      redirect_to post_path(@comment.post.id)
    else
      render 'edit'
    end
  end

  def destroy
    @comment_first = Comment.find_by_post_id(params[:post_id])
    @topic_id = @comment_first.post.topic.id
    if @comment_first.id.to_i == params[:id].to_i
      Post.destroy(@comment_first.post_id)
      redirect_to topic_path(@topic_id)
    else
      Comment.destroy(params[:id])
      redirect_to post_path(params[:post_id])
    end
  end

  private
  def comments_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
