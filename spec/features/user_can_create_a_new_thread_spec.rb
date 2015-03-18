require "rails_helper"

feature "user can create a new thread" do
  scenario "with valid input" do
    board = create(:board)
    visit board_path(board)

    fill_form(:topic, { topic_name: "My thread", description: "This is my thread" })
    click_on "Submit"

    expect(page).to have_content("Thread created!")
  end
end
