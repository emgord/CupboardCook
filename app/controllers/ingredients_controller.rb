class IngredientsController < ApplicationController
  before_action :require_user

  def search
    @ingredients = Ingredient.ingredient_add_search(params[:query])
    if request.xhr?
      render :json => @ingredients.to_json
    else
      redirect_to root_path
    end
  end
end
