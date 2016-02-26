class RecipesController < ApplicationController
  def index
    @recipes = current_user.find_recipes
  end
end
