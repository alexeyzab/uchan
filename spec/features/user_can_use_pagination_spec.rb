require "rails_helper"

feature "user can use pagination to navigate" do
  scenario "to see the next 10 topics" do
    board = create(:board)
    oldest_topic = create(:topic, board: board, topic_name: "Oldest topic title")
    create_list(:topic, 10, board: board)
    visit board_path(board)

    click_link "Next"

    expect(page).to have_content(oldest_topic.topic_name)
  end
end
