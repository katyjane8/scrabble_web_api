class WelcomeController < ApplicationController
  def index
    if WordService.all.nil?
      @words = WordService.all.word
    else
      @words = WordService.all(params[:play_word][:word])
    end
  end

  def create
    @word = params[:word]

    @conn = Faraday.new("https://od-api.oxforddictionaries.com/api/v1") do |f|
      f.request :url_encoded
      f.adapter Faraday.default_adapter
      f.headers["Accept"] = "application/json"
      f.headers['app_id'] = ENV['OXFORD_APP_ID']
      f.headers['app_key'] = ENV['OXFORD_APP_KEY']
    end

    response = @conn.get("inflections/en/#{@word}")

    if response.status == 404
      render :invalid
    else response.status != 404
      body = JSON.parse(response.body, symbolize_names: true)
      @root = body[:results].first[:lexicalEntries].first[:inflectionOf].first[:id]
      render :index
    end
  end

  def new
  end
end
