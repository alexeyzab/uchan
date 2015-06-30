class PostsController < ApplicationController
  before_action :get_topic

  def new
    @post = @topic.posts.build(post_params)
  end

  def create
    @board = Board.find(params[:board_id])
    @post = @topic.posts.create(post_params)
    if @topic.save && @post.post_image?
      flash[:notice] = "Post created! Image successfully uploaded!"
      redirect_to board_topic_path(@board, @topic)
    elsif @topic.save
      flash[:notice] = "Post created!"
      redirect_to board_topic_path(@board, @topic)
    else
      flash[:error] = @post.errors.full_messages.to_sentence
      redirect_to board_topic_path(@board, @topic, :post => params[:post])
    end
  end

  private

  def post_params
    params.require(:post).permit(:post_title, :post_description, :post_image)
  end

  def get_topic
    @topic = Topic.find(params[:topic_id])
  end
end
