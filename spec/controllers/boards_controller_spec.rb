require "rails_helper"

describe BoardsController do
  describe "#index" do
    it "shows all boards" do
      get :index

      expect(response.status).to eq(200)
    end

    it "shows the topic count" do
      topic = create(:topic)
      get :index

      expect(assigns(:topics_count)).to eq(1)
    end
  end

  describe "#show" do
    it "shows a particular board" do
      board = create(:board)
      get :show, params: { id: board.slug }

      expect(response.status).to eq(200)
    end
  end
end
