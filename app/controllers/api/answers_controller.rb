class Api::AnswersController < ApiController
  protect_from_forgery with: :null_session

  def index
    @answers = Answer.find(params[:answer_id])
    render json: @answer
  end

  def new
    @answer = Answer.new
  end

  def create
    answer = Answer.new(new_answer_params)
    if answer.save
      render json: :nothing, status: :created, location: api_question_answers_path(answer)
    else
      render json: :nothing, status: :not_found
    end
  end

  def index
    @answers = Question.find(params[:question_id]).answers
    render json: @answers
  end

  protected

  def new_answer_params
    params.require(:answer).permit(:body, :question_id, :user_id)
  end
end
