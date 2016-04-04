require "rails_helper"

describe CatalogsController do

  describe "#show" do
    context "with valid topics" do
      it "shows the topics and their images" do
        board = create(:board)
        catalog = create(:catalog, board: board)

        get :show, params: { board_id: board.slug }

        expect(response.status).to eq(200)
      end
    end
  end
end
