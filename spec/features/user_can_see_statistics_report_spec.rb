require "rails_helper"

feature "user can see the statistics report" do
  scenario "total amount of topics" do
    create(:topic)
    visit root_path

    expect(page).to have_content("Total Topics: 1")
  end
end
