class RecipesController < ApplicationController
  before_action :require_user

  def index
    @recipes = current_user.find_recipes_as_json
    @user_ingredients = current_user.pantry_items_as_json
  end

  def find_recipes
    render json: current_user.find_recipes_as_json(missing_params)
  end


  private

  def missing_params
    params.require(:missing)
  end
end
