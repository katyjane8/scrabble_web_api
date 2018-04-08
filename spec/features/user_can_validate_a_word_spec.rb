require 'rails_helper'

feature "As a user when I visit the root page" do
  it "will validate the word foxes" do
    visit '/'

    fill_in "word", with: "foxes"

    click_on "Validate Word"

    expect(page).to have_content("foxes is a valid word")
    expect(page).to have_content("its root form is fox")
  end

  it "will reject the word foxez" do
    visit '/'

    fill_in "word", with: "foxez"

    click_on "Validate Word"

    expect(page).to have_content("foxez is not a valid word.")
  end
end
