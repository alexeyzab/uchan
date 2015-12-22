class TopicsController < ApplicationController
  layout "board", only: :show
  before_action :get_board

  def show
    @boards = Board.all
    @topic = @board.topics.find(params[:id])
    @posts = @topic.posts.order("created_at ASC")
    @post = @topic.posts.build
  end

  def new
    @topic = @board.topics.build(topic_params)
  end

  def create
    @topic = @board.topics.create(topic_params)
    if @topic.save
      flash[:notice] = "Topic created!"
      redirect_to board_topic_path(@board, @topic)
    else
      flash[:error] = @topic.errors.full_messages.to_sentence
      redirect_to board_path(@board)
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:topic_name, :description, :topic_image)
  end

  def get_board
    @board = Board.find(params[:board_id])
  end
end
