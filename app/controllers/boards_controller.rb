class BoardsController < ApplicationController

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    @topics = @board.topics.order("created_at ASC")
    @topic = @board.topics.build
  end

  private

  def board_params
    params.require(:board).permit(:name, :id)
  end
end
