require "rails_helper"

feature "User visits the board" do
  scenario "user can see the topics for this particular board" do
    board = build(:board)
    topic = create(:topic, board: board)
    topic2 = create(:topic, board: board)

    visit board_path(board)

    expect(page).to have_content(topic.topic_name)
    expect(page).to have_content(topic2.topic_name)
  end
end
