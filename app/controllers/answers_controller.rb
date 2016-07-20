class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(new_answer_params)
    @user = current_user
    @answer.user = @user

    if @answer.save?
      redirect_to @user, notice: "Question answered!"
    else
      flash[:alert] = "Not answered successfully, please try again."
      render :new
    end
  end

  protected

  def new_answer_params
    params.require(:answer).permit(:body, :question_id)
  end

end
