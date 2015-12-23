class TopicsController < ApplicationController
  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts(:order => 'featured, updated_at DESC').page(params[:page]).per(10)
    if !current_user && @topic.logged
      redirect_to new_user_registration_path
    end

  end

  # def create
  #   @topic = Topic.new(topics_params)
  #   if @topic.save
  #     redirect_to topic_path(@topic.id)
  #   else
  #     render 'new'
  #   end
  # end
  #
  # def new
  #   @topic = Topic.new
  # end
  #
  # private
  # def topics_params
  #   params.require(:topic).permit(:name, :category_id, :topic_id, :description)
  # end

end
