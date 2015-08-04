require "rails_helper"

feature "user can use pagination to navigate" do
  scenario "to see the next 10 topics" do
    board = create(:board)
    10.times do
      create(:topic, board: board, thread_name: "This is thread #{rand(1..15)}")
    end
    newest_topic = create(:topic, board: board, thread_name: "Newest topic title")
    visit board_path(board)

    first(".pagination").click_link "Next →"

    expect(page).to have_content(newest_topic.thread_name)
  end
end
