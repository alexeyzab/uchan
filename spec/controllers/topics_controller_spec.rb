require "rails_helper"

describe TopicsController do

  describe "#show" do
    it "shows the particular topic" do
      board = create(:board)
      topic = create(:topic, board: board)

      get :show, params: { id: topic.id, board_id: board.slug }

      expect(response.status).to eq (200)
    end
  end

  describe "#create" do
    context "with valid params" do
      it "creates a topic" do
        board = create(:board)
        post :create, params: { board_id: board.slug, topic: { topic_name: "Test topic",
                                                      description: "Description",
                                                      topic_image: fixture_file_upload("#{Rails.root}/spec/support/test.jpg", "image/jpg") } }

        expect(Topic.count).to eq(1)
      end
    end

    context "with invalid params" do
      it "doesn't create a topic" do
        board = create(:board)
        post :create, params: { board_id: board.slug, topic: { topic_name: nil, description: nil } }

        expect(Topic.count).to eq(0)
      end
    end
  end
end
