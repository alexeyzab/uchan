require "rails_helper"

describe Board do
  it "has proper attributes" do
    board = build(:board, name: "Travel", slug: "travel")

    expect(board).to be_valid
  end

  it "can't be created with wrong attributes" do
    board = build(:board, name: nil, slug: nil)

    expect(board).to be_invalid
    expect(board.errors[:name]).to eq(["can't be blank"])
    expect(board.errors[:slug]).to eq(["can't be blank"])
  end

  it "has the unique name" do
    board = create(:board, name: "Travel")
    board_two = build(:board, name: "Travel")

    expect(board_two).to be_invalid
  end

  it "has the proper name length" do
    board = build(:board, name: "#{'a' * 41}")

    expect(board).to be_invalid
  end

  describe "#to_param" do
    it "returns the slug" do
      board = create(:board, name: "Travel")

      expect(board.to_param).to eq(board.slug)
    end
  end
end
