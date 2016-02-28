class UserIngredientsController < ApplicationController
  before_action :require_user

  def create
    @item = UserIngredient.new(amount_params)
    @item.ingredient_id = item_params
    @item.user_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      render index
    end
  end

  def index
    @item = UserIngredient.new
    @ingredients = Ingredient.all
    @pantry_items = current_user.ingredients.all
  end

  private

  def amount_params
    params.require(:user_ingredient).permit(:amount,:unit)
  end
  def item_params
    params.require(:ingredient)
  end


end
