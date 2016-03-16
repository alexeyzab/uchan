class BoardsController < ApplicationController
  layout "board", only: :show

  def index
    @boards = Board.all
    @topics_count = Topic.count
  end

  def show
    @board = Board.find_by_slug(params[:id])
    @boards = Board.all
    @topics = @board.topics.bump_order.page(params[:page])
    @topic = @board.topics.build
  end

  private

  def board_params
    params.require(:board).permit(:name, :slug, :id, :category)
  end
end
