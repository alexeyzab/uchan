require "rails_helper"

describe Board do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:slug) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_length_of(:name).
       is_at_most(40) }
  it { should have_one(:catalog) }
  
  describe "#to_param" do
    it "returns the slug" do
      board = create(:board)
      expect(board.to_param).to eq(board.slug)
    end
  end
end
