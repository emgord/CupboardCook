class UserIngredientsController < ApplicationController
  before_action :require_user

  def create
    @item = UserIngredient.new(user_ingredient_params)
    @item.user_id = current_user.id
    if @item.save
      @new_ingredient = Ingredient.find(@item.ingredient_id)
      render json: @new_ingredient
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def index
    @ingredients = Ingredient.all
    @pantry_items = current_user.ingredients.all.as_json
  end

  private

  def user_ingredient_params
    params.require(:user_ingredients).permit(:amount,:unit,:ingredient_id)
  end

end
