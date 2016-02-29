class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def search
    @ingredients = Ingredient.search(params[:query])
    if request.xhr?
      render :json => @ingredients.to_json
    else
      redirect_to root_path
    end
  end

end
