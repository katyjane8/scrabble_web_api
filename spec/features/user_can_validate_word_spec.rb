# * Use endpoint "GET /inflections/{source_lang}/{word_id}" under the "Lemmatron" heading
require 'rails_helper'

describe "As a user when I visit the root page" do
  it "I can fill in a text box with foxes" do
    visit "/"

    fill_in "play_word[word]", with: "foxes"

    click_on "Validate Word"

    expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'.")
  end

  it "I can fill in a text box with foxez" do
    visit "/"

    fill_in "play_word[word]", with: "foxez"

    click_on "Validate Word"

    expect(page).to have_content("'foxez' is not a valid word.")
  end
end

# As a user
# When I visit "/"
# And I fill in a text box with "foxez"
# And I click "Validate Word"
# Then I should see a message that says "'foxez' is not a valid word."
