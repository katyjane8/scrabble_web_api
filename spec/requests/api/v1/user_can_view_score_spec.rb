require 'rails_helper'

RSpec.describe "When I send a GET request to '/api/v1/games/1'" do
  it "will receive a JSON response as follows:" do
    {
      "game_id":1,
      "scores": [
        {
          "user_id":1,
          "score":15
        },
        {
          "user_id":2,
          "score":16
        }
      ]
    }
  end
end
