require "rails_helper"

describe BoardsController do
  describe "#index" do
    it "shows all boards" do
      get :index

      expect(response.status).to eq(200)
    end
  end

  describe "#show" do
    it "shows a particular board" do
      board = create(:board)
      get :show, { id: board.id }

      expect(response.status).to eq(200)
    end
  end
end