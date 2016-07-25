class Api::TeamsController < ApiController
  def index
    @teams = Organization.find(params[:organization_id]).teams

    render json: @teams
  end
end
