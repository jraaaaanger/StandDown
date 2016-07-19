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
    @organization = Organization.new(new_organization_params)
    @organization.creator = current_user

    if @organization.save
      flash[:notice] = @organization.name + ' Added!'
      redirect_to @organization
    else
      flash[:alert] = 'Something went wrong. Please try again!'
      render :new
    end
  end

  protected

  def new_organization_params
    params.require(:organization).permit(:name, :description)
  end
end
