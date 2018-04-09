require 'rails_helper'

RSpec.describe "When I send a POST an invalid word" do
  before :each do
    @erika = User.create(id: 1, name: "Erika")
    @katy = User.create(id: 2, name: "Katy")

    @game = Game.create(player_1: @erika, player_2: @katy)

    @erika.plays.create(game: @game, word: "moo", score: 5)
    @erika.plays.create(game: @game, word: "zoo", score: 12)
    @katy.plays.create(game: @game, word: "cat", score: 5)
    @katy.plays.create(game: @game, word: "joy", score: 13)
  end
  
  it "will not allow invalid word to be added" do
  game_params = {user_id: 1, word: "supercalifrag"}
    post "/api/v1/games/#{@game.id}", params: game_params
    expect(response).to be_success
    body = JSON.parse(response.body)

    expect(body).to be_a Hash
    expect(body["message"]).to eq("supercalifrag is not a valid word.")
  end
end
