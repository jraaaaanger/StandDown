class Api::AnswersController < ApplicationController
  def index
    @answers = Answer.find(params[:answer_id])
    render json: @answer
  end
end
