require "rails_helper"

describe PostsController do

  describe "#create" do
    context "with valid input" do
      it "creates a topic" do
        board = create(:board)
        topic = create(:topic, board_id: board.id)

        post :create, { topic_id: topic.id, board_id: board.id, post: { post_title: "Test post", post_description: "Test post description" } }

        expect(Post.count).to eq(1)
      end
    end

    context "with invalid params" do
      it "doesn't create a topic" do
        board = create(:board)
        topic = create(:topic, board_id: board.id)
        
        post :create, { topic_id: topic.id, board_id: board.id, post: { post_title: nil, post_description: nil } }

        expect(Post.count).to eq(0)
      end
    end
  end
end
