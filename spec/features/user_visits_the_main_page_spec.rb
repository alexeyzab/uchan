require "rails_helper"

feature "User visits the main page" do
  scenario "shows the list of all boards" do
    board1 = create(:board)
    board2 = create(:board)
    board3 = create(:board)

    visit root_path

    expect(page).to have_content(board1.name)
    expect(page).to have_content(board2.name)
    expect(page).to have_content(board3.name)
  end

  scenario "shows me a particular board when I click on it" do
    board1 = create(:board)
    board2 = create(:board)

    visit root_path

    click_link(board1.name)
    expect(page).to have_content(board1.name)
    expect(page).to_not have_content(board2.name)
  end

  scenario "shows the static pages" do
    visit root_path

    expect(page).to have_content("About")
    expect(page).to have_content("Contact")
    expect(page).to have_content("FAQ")
  end
end
