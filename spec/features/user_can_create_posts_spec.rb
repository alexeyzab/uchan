require "rails_helper"

feature "user can create a post inside a topic" do
  scenario "with valid input" do
    board = create(:board)
    topic = create(:topic, board: board)
    visit board_topic_path(board, topic)

    fill_form(:post, { post_title: "My title", post_description: "This is my post"})
    click_on "Create Post"

    expect(page).to have_content("Post created!")
  end

  scenario "with invalid input" do
    board = create(:board)
    topic = create(:topic, board: board)
    visit board_topic_path(board, topic)

    click_on "Create Post"

    expect(page).to have_content("Post description can't be blank")
  end
end
