require 'rails_helper'

RSpec.describe "When I send a POST an invalid word" do
  it "will not allow invalid word to be added" do
  game_params = {user_id: 1, word: "supercalifrag"}
    post "/api/v1/games/#{@game.id}", params: game_params
    expect(response).to be_success
    body = JSON.parse(response.body)

    expect(body).to be_a Hash
    expect(body["message"]).to eq("supercalifrag is not a valid word.")
  end
end
