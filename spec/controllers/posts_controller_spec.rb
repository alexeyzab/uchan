require "rails_helper"

describe PostsController do

  describe "#create" do
    context "with valid input" do
      it "creates a post" do
        board = create(:board)
        topic = create(:topic, board: board)

        post :create, { topic_id: topic.id, board_id: board.slug, post: { post_title: "Test post", post_description: "Test post description" } }

        expect(Post.count).to eq(1)
      end

      it "allows you to upload an image" do
        board = create(:board)
        topic = create(:topic, board: board)

        post :create, { topic_id: topic.id, board_id: board.slug, post: { post_title: "Test post", post_description: "Test post description", post_image: fixture_file_upload("#{Rails.root}/spec/support/test.jpg", "image/jpg") } }

        expect(Post.count).to eq(1)
      end

      it "checks if the topic has reached bumplimit before create action" do
        board = create(:board)
        topic = create(:topic, board: board)
        allow(controller).to receive(:check_if_bumplimit)

        post :create, { topic_id: topic.id, board_id: board.slug, post: { post_title: "Test post", post_description: "Test post description" } }

        expect(controller).to have_received(:check_if_bumplimit)
      end
    end

    context "with invalid params" do
      it "doesn't create a post" do
        board = create(:board)
        topic = create(:topic, board: board)

        post :create, { topic_id: topic.id, board_id: board.slug, post: { post_title: nil, post_description: nil } }

        expect(Post.count).to eq(0)
      end
    end
  end
end
