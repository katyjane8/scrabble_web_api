class Word

  def initialize
    @conn = Faraday.new(:url => 'https://od-api.oxforddictionaries.com/api/v1') do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end

  def self.all
    @conn.get do |req|
      req.headers['app_id'] = '661bf962'
      req.headers['app_key'] = 'ec6892cd0e1d6ffa693c9145ddaaea9b'
    end
  end
end
