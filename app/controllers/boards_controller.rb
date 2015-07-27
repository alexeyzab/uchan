class BoardsController < ApplicationController
  layout "board", only: :show

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    @boards = Board.all
    @topics = @board.topics.order_topics
    @topic = @board.topics.build
  end

  private

  def board_params
    params.require(:board).permit(:name, :id, :category)
  end
end
