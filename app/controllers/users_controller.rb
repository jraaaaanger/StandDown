class UsersController < ApplicationController
  def index
    if current_user
      @organization = current_user.organization
      @last_answers = @organization.answers.last(10).reverse
    end
  end
end
