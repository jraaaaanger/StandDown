class Api::AnswersController < ApiController
  def index
    @answers = Answer.find(params[:answer_id])
    render json: @answer
  end

  def new
    binding.pry
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    answer = Answer.new(new_answer_params)
    answer.question = @question
    binding.pry
    if answer.save
      render json: :nothing, status: :created, location: api_question_answers(answer)
    else
      render json: :nothing, status: :not_found
    end
  end

  def index
    binding.pry
    @answers = Question.find(params[:question_id]).answers
    render json: @answers
  end

  protected

  def new_answer_params
    params.permit(:answer).require(:user_id, :body)
  end
end
