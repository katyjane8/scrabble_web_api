require 'rails_helper'

RSpec.describe "When I send a GET request to '/api/v1/games/1'" do
    before :each do
    @erika = User.create(id: 1, name: "Erika")
    @katy = User.create(id: 2, name: "Katy")

    @game = Game.create(player_1: @erika, player_2: @katy)

    @erika.plays.create(game: @game, word: "katy", score: 3)
    @erika.plays.create(game: @game, word: "zoo", score: 12)
    @katy.plays.create(game: @game, word: "erika", score: 14)
    @katy.plays.create(game: @game, word: "no", score: 2)
  end

  it "will receive a JSON response as follows:" do
    get "/api/v1/games/#{@game.id}"

    expect(response).to be_success
    game_score = JSON.parse(response.body)

    expect(game_score).to be_a Hash
    expect(game_score["id"]).to eq(@game.id)
    expect(@erika.total_score).to eq 15
    expect(@katy.total_score).to eq 16
  end
end
