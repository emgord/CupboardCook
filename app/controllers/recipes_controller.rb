class RecipesController < ApplicationController
  before_action :require_user

  def index
    @recipes = current_user.find_recipes_as_json({missing: 0, heart: false})
    @user_ingredients = current_user.pantry_items_as_json
  end

  def find_recipes
    search_options = {}
    search_options[:missing] = search_option_params["missing"].to_i
    search_options[:heart] = search_option_params[:heart]
    render json: current_user.find_recipes_as_json(search_options)
  end


  private

  def search_option_params
    params.require(:search_options).permit(:missing, :heart)
  end

end
