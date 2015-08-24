require "rails_helper"

feature "user can create a post inside a topic" do
  scenario "with valid input" do
    prepare_board_topic

    fill_form(:post, { post_title: "My title", post_description: "This is my post" })
    click_on "Create Post"

    expect(page).to have_content("Post created!")
  end

  scenario "with invalid input" do
    prepare_board_topic

    click_on "Create Post"

    expect(page).to have_content("Post description can't be blank")
  end

  scenario "with an image" do
    prepare_board_topic

    fill_form(:post, { post_title: "My post", post_description: "This is another post" })
    attach_file "post_post_image", "#{Rails.root}/spec/support/test.jpg"
    click_on "Create Post"

    expect(page).to have_content("Post created!")
    expect(page).to have_content("Image successfully uploaded!")
  end

  scenario "when the topic has 500 posts, user can't create a post" do
    board = create(:board)
    topic = create(:topic, board: board)
    500.times do
      create(:post, topic: topic, board: board)
    end
    visit board_topic_path(board, topic)

    fill_form(:post, { post_title: "My post", post_description: "This is another post" })
    click_on "Create Post"

    expect(page).to have_content("This thread has reached bumplimit, you can't make a new post")
  end

  def prepare_board_topic
    board = create(:board)
    topic = create(:topic, board: board)
    visit board_topic_path(board, topic)
  end
end
