class PostsController < ApplicationController
  before_action :get_topic, :get_board
  before_filter :check_if_bumplimit, :only => :create

  def new
    @post = @topic.posts.build(post_params)
  end

  def create
    @post = @topic.posts.create(post_params)
    @post.board_id = @board.id
    if @post.save && @post.post_image?
      flash[:notice] = "Post created! Image successfully uploaded!"
      redirect_to board_topic_path(@board, @topic)
    elsif @post.save
      flash[:notice] = "Post created!"
      redirect_to board_topic_path(@board, @topic)
    else
      flash[:error] = @post.errors.full_messages.to_sentence
      redirect_to board_topic_path(@board, @topic, :post => params[:post])
    end
  end

  private

  def check_if_bumplimit
    if @topic.bumplimit?
      flash[:error] = "This topic has reached bumplimit, you can't make a new post"
      redirect_to board_topic_path(@board, @topic)
    end
  end

  def post_params
    params.require(:post).permit(:post_title, :post_description, :post_image)
  end

  def get_topic
    @topic = Topic.find(params[:topic_id])
  end

  def get_board
    @board = Board.find_by_slug(params[:board_id])
  end
end
