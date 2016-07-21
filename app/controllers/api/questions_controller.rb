class Api::QuestionsController < ApiController
  def index
    @team = Team.find(params[:team_id])
    @questions = @team.questions
    render json: @questions
  end
end
