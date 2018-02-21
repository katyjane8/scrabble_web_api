class WelcomeController < ApplicationController
  def index
    @word = Word.all
  end
end
