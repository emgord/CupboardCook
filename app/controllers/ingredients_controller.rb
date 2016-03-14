class IngredientsController < ApplicationController
  before_action :require_user

  def search
    @ingredients = Ingredient.ingredient_add_search(params[:query])
    render :json => @ingredients.to_json
  end

end
