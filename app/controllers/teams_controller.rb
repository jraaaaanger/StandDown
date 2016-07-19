class TeamsController < ApplicationController

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

  def show
    @team = Team.find(params[:id])
    @organization = @team.organization
  end

  protected

  def new_team_params
    params.require(:team).permit(:name, :description, :city, :state,
                                 :country, :timezone, :organization_id)
  end
end
