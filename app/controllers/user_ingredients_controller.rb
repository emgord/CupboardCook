class UserIngredientsController < ApplicationController
  before_action :require_user

  def create
    @item = UserIngredient.new(user_ingredient_params)
    @item.user_id = current_user.id
    if @item.save
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def index
    @item = UserIngredient.new
    @ingredients = Ingredient.all
    @pantry_items = current_user.ingredients.all
  end

  private

  def user_ingredient_params
    params.require(:user_ingredients).permit(:amount,:unit,:ingredient_id)
  end

end
