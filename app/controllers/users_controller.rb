class UsersController < ApplicationController

  def index
    @users = User.page(params[:page]).per(9)
  end

  def destroy
    redirect_to destroy_user_session_path
  end

  def ban
    if current_user.is_admin? or current_user.is_moderator?
      @user = User.find(params[:id])
      @user.block = !@user.block
      @user.save
    end
    redirect_to user_path(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order('updated_at DESC').page(params[:page]).per(10)
    @post_comments = @user.comments.order('updated_at DESC').page(params[:page]).per(10)
    # @post_comments = @user.comments.select(:post_id).distinct.order('updated_at DESC').page(params[:page]).per(10)
  end

  def create
    @user = User.new(users_params)
    @user.permission = false
    @user.block = false
    if @user.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  private
  def users_params
    params.require(:user).permit(:name, :email, :block, :password, :password_confirmation)
  end

end
