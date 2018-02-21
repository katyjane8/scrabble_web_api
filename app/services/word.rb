class Word
  def valid_word
    @words = WordService.all.map do |result|
      WordService.new(result)
    end
  end
end
