require "rails_helper"

feature "user can create a post inside a topic" do
  scenario "with valid input" do
    prepare_board_topic

    fill_form(:post, { post_title: "My title", post_description: "This is my post" })
    click_on "Create Post"

    expect(page).to have_content("Post created!")
  end

  scenario "with an image" do
    prepare_board_topic

    fill_form(:post, { post_title: "My post", post_description: "This is another post" })
    attach_file "post_post_image", "#{Rails.root}/spec/support/test.jpg"
    click_on "Create Post"

    expect(page).to have_content("Post created!")
    expect(page).to have_content("Image successfully uploaded!")
  end

  def prepare_board_topic
    board = create(:board)
    topic = create(:topic, board: board)
    visit board_topic_path(board, topic)
  end
end
