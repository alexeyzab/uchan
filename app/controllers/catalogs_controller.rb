class CatalogsController < ApplicationController
  layout "board", only: :show
  before_action :get_board

  def show
    @boards = Board.all
    @catalog = @board.catalog
    @topics = @catalog.topics
  end

  private

  def get_board
    @board = Board.find(params[:board_id])
  end
end
