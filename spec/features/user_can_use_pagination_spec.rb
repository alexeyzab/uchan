require "rails_helper"

feature "user can use pagination to navigate" do
  scenario "to see the next 10 topics" do
    board = create(:board)
    oldest_topic = create(:topic, board: board, thread_name: "Oldest topic title")
    10.times do
      create(:topic, board: board, thread_name: "This is thread #{rand(1..15)}")
    end
    visit board_path(board)

    click_link "Next"

    expect(page).to have_content(oldest_topic.thread_name)
  end
end
