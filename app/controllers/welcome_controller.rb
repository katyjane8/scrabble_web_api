class WelcomeController < ApplicationController
  def index
    @words = Word.validate_word(@word)
  end
end
