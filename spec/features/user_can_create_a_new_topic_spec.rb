require "rails_helper"

feature "user can create a new topic" do
  scenario "with a valid input" do
    board = create(:board)
    visit board_path(board)

    fill_form(:topic, { thread_name: "My topic", description: "This is my topic" })
    attach_file "topic_topic_image", "#{Rails.root}/spec/support/test.jpg"
    click_on "Create Thread"

    expect(page).to have_content("Thread created!")
  end

  scenario "with invalid input" do
    board = create(:board)
    visit board_path(board)

    click_on "Create Thread"

    expect(page).to have_content("Thread name can't be blank")
    expect(page).to have_content("Description can't be blank")
  end

  scenario "overwriting the oldest topic" do
    board = create(:board)
    oldest_topic = create(:topic, board: board, thread_name: "Oldest thread")
    49.times do
      create(:topic, board: board)
    end
    visit board_path(board)

    create(:topic, board: board)

    visit board_path(board)
    click_link "5"
    expect(page).to_not have_content(oldest_topic.thread_name)
    expect(page).to_not have_link("^=6")
  end
end
