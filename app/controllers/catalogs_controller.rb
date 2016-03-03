class CatalogsController < ApplicationController
  before_action :get_board

  def show
    @catalog = @board.catalog
  end

  private

  def get_board
    @board = Board.find(params[:board_id])
  end
end
