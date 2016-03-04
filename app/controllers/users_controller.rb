class UsersController < ApplicationController
  def show
  end

  def find_recipes
    render json: current_user.find_recipes_as_json
  end

end
