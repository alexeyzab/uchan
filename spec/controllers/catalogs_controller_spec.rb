require "rails_helper"

describe CatalogsController do

  describe "#show" do
    context "with valid topics" do
      it "shows the topics and their images" do
        board = create(:board)
        catalog = create(:catalog, board_id: board.id)

        get :show, { board_id: board.id }

        expect(response.status).to eq(200)
      end
    end
  end
end
