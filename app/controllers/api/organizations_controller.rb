class Api::OrganizationsController < ApiController
  def index
    @answers = Organization.find(params[:organization_id]).answers.reverse
  end
end
