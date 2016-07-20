class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = Answer.new(new_answer_params)
    @user = current_user
    @answer.user = @user

    if @answer.save
      redirect_to root_path, notice: 'Question answered!'
    else
      flash[:alert] = 'Not answered successfully, please try again.'
      render :new
    end
  end

  protected

  def new_answer_params
    params.require(:answer).permit(:body)
  end
end
