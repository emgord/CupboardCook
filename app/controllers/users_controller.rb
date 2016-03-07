class UsersController < ApplicationController
  before_action :require_user

  def find_recipes
    render json: current_user.find_recipes_as_json
  end

end
