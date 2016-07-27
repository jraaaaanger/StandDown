class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
    @teams = @organization.teams
    @last_answers = @organization.answers.last(10)
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(new_organization_params)
    @organization.creator = current_user

    @q1 = Question.new(body: 'What did you work on yesterday?')
    @q2 = Question.new(body: 'What did you finish yesterday?')
    @q3 = Question.new(body: 'What are you working on today?')
    @organization.questions << [@q1, @q2, @q3]

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
    params.require(:organization).permit(:name, :description, :start)
  end
end
