require 'rails_helper'

RSpec.describe "When I send a POST request to “/api/v1/games/1/plays” with a user_id=1 and word=at" do
    before :each do
    @erika = User.create(id: 1, name: "Erika")
    @katy = User.create(id: 2, name: "Katy")

    @game = Game.create(player_1: @erika, player_2: @katy)

    @erika.plays.create(game: @game, word: "moo", score: 5)
    @erika.plays.create(game: @game, word: "zoo", score: 12)
    @katy.plays.create(game: @game, word: "cat", score: 5)
    @katy.plays.create(game: @game, word: "joy", score: 13)
  end

  it "should receive a 201 Created Response" do
    game_params = {user_id: 1, word: "at"}
    post "/api/v1/games/#{@game.id}", params: game_params

    expect(response).to be_success
    game_score = JSON.parse(response.body)

    expect(game_score).to be_a Hash
    expect(game_score["game_id"]).to eq(@game.id)
    expect(game_score["scores"]).to be_a Array
    expect(game_score["scores"].first["user_id"]).to eq @erika.id
    expect(game_score["scores"].second["user_id"]).to eq @katy.id
    expect(game_score["scores"].first["score"]).to eq 19
    expect(game_score["scores"].second["score"]).to eq 18
  end
end
