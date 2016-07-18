class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
    @teams = @organization.teams
  end

  def new
    @organization = Organization.new
  end

end
