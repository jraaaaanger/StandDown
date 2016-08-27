class Api::AnswersController < ApiController
  protect_from_forgery with: :null_session

  def new
    @answer = Answer.new
  end

  def create
    answer = Answer.new(new_answer_params)
    answer.question = Question.find(params[:question_id])
    if answer.save
      render json: :nothing, status: :created, location: api_question_answers_path(answer)
    else
      render json: :nothing, status: :not_found
    end
  end

  def show
    @user = User.find(params[:user_id])
    answers = @user.answers
    most_recent_answer = answers.last

    render json: most_recent_answer
  end

  def index
    @answers = Team.find(params[:team_id]).answers.limit(10)
  end

  protected

  def new_answer_params
    params.require(:answer).permit(:body, :question_id, :user_id)
  end
end
