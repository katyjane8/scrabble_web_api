class WelcomeController < ApplicationController
  def index
    if WordService.all.nil?
      @words = WordService.all.word
    else
      @words = WordService.all(params[:play_word][:word])
    end
  end
end
