class RecipesController < ApplicationController
  def index
    @recipes = current_user.find_recipes_as_json
    @user_ingredients = current_user.pantry_items_as_json
  end
end
