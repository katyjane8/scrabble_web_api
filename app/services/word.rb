class Word

  def self.validate_word(word)
    result = WordService.all(word)
    if result == nil
    end
  end
end


# def self.filter(zip)
#   forecast = WeatherService.new(zip).parsed_json
#   forecast.map do |date|
#     Forecast.new(date)
#   end
# end
