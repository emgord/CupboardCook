class RecipesController < ApplicationController
  before_action :require_user

  def index
    @recipes = current_user.find_recipes_as_json
    @user_ingredients = current_user.pantry_items_as_json(0)
  end

  def find_recipes
    render json: current_user.find_recipes_as_json(missing_params)
  end

  def heart_recipes
    ###  if able to implement cooked vs heart, use this : current_user.recipes.where(user_recipes: {heart: true}).
    render json: current_user.recipes
  end


  private

  def missing_params
    params.require(:missing)
  end
end
