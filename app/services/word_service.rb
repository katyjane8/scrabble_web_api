class WordService

  def self.all(word)
   @conn = Faraday.new(:url => "https://od-api.oxforddictionaries.com/api/v1/inflections/en/#{word}") do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
    response = @conn.get do |req|
      req.headers['app_id'] = '661bf962'
      req.headers['app_key'] = 'ec6892cd0e1d6ffa693c9145ddaaea9b'
    end
      if response.status == 404
        return nil
      else
        response.status != 404
        resp = JSON.parse(response.body, symbolize_names: true)
        resp[:results][0]
      end
  end
end
