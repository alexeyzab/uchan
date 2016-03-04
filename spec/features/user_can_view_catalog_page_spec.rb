require "rails_helper"

feature "User views the catalog page" do
  scenario "user can see the topics' names and their first image" do
    board = build(:board)
    topic = create(:topic, board: board)
    topic2 = create(:topic, board: board)
    catalog = create(:catalog, board: board)

    visit board_catalog_path(board)

    expect(page).to have_content(topic.topic_name)
    expect(page).to have_content(topic2.topic_name)
  end
end
