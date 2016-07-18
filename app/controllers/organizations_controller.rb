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

  def create
    @organization = Organization.new(params[:id])
    @organization.creator = current_user

    if @organization.save
      redirect_to @organization
    else
      flash[:alert] = 'Something went wrong. Please try again!'
      render :new
    end
    
  end

end
