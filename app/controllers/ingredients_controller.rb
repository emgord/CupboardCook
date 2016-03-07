class IngredientsController < ApplicationController
  before_action :require_user

  def search
    @ingredients = Ingredient.search(params[:query])
    render :json => @ingredients.to_json
  end

end
