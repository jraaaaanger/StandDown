class Api::AnswersController < ApplicationController
  def index
    @answers = Answer.find(params[:answer_id])
    render json: @answer
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new
    render json: @answer
  end

  def index
    @answer = Answer.new
  end

  protected

  def new_answer_params
  end
end
