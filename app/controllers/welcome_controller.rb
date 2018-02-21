class WelcomeController < ApplicationController
  def index
    @words = WordService.all
  end
end
