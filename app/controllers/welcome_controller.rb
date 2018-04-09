class WelcomeController < ApplicationController
  def index
  end

  def create
    @word = params[:word]
    validate = WordService.new(@word)

    if validate.status_code == 404
      render :invalid
    else response.status == 200
      @root = validate.root
      render :valid
    end
  end

  def new
  end
end
