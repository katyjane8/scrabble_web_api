class WordService
  def initialize(word)
    @word = word
  end

  def status_code
    response.status
  end

  def root
    raw_data[:results].first[:lexicalEntries].first[:inflectionOf].first[:id]
  end

  def conn
    @conn = Faraday.new("https://od-api.oxforddictionaries.com/api/v1") do |f|
      f.request :url_encoded
      f.adapter Faraday.default_adapter
      f.headers["Accept"] = "application/json"
      f.headers['app_id'] = ENV['OXFORD_APP_ID']
      f.headers['app_key'] = ENV['OXFORD_APP_KEY']
    end
  end

  def response
    conn.get("inflections/en/#{@word}")
  end

  def raw_data
    JSON.parse(response.body, symbolize_names: true)
  end
end
