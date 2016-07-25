class TeamsController < ApplicationController

  def index
    @organization = Organization.find(params[:organization_id])
    @teams = @organization.teams
  end

  def show
    @team = Team.find(params[:id])
    @organization = @team.organization
    @users = @team.users
    @questions = @team.questions
    @last_answers = @team.answers.last(10).sort.reverse
    @user_time = current_user.team.timezone
  end

  def new
    @team = Team.new
    @orgs = Organization.all
  end

  def create
    @team = Team.new(new_team_params)
    if @team.save
      @user = current_user
      @user.team = @team
      @user.save
      redirect_to team_path(@team)
    else
      flash[:error] = 'Please try again!'
      render :new
    end
  end

  protected

  def new_team_params
    params.require(:team).permit(:name, :description, :city, :state,
                                 :country, :timezone, :organization_id)
  end
end
