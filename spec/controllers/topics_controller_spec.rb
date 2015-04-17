require "rails_helper"

describe TopicsController do

  describe "#show" do
    it "shows the particular topic" do
      board = create(:board)
      topic = create(:topic, board: board)

      get :show, { id: topic.id, board_id: board.id }

      expect(response.status).to eq (200)
    end
  end

  describe "#create" do
    context "with valid params" do
      it "creates a topic" do
        board = create(:board)
        post :create, { board_id: board.id, topic: { thread_name: "Test topic",
                                                      description: "Description" } }

        expect(Topic.count).to eq(1)
      end
    end

    context "with invalid params" do
      it "doesn't create a topic" do
        board = create(:board)
        post :create, { board_id: board.id, topic: { thread_name: nil, description: nil } }

        expect(Topic.count).to eq(0)
      end
    end
  end
end
