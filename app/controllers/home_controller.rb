class HomeController < ApplicationController
  def index
    if current_user
      @questions = current_user.might_be_interseted_questions
    end
  end
end
