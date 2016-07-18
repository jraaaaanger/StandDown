class TeamsController < ApplicationController

  def show
    @team = Team.find(params[:id])
    @organization = @team.organization
  end

end
