class UserIngredientsController < ApplicationController
  before_action :require_user

  def create
    @item = UserIngredient.new(user_ingredient_params)
    @item.user_id = current_user.id
    if @item.save
      render json: @item.as_json(:except => [:create_at, :updated_at],
                                 :include => {:ingredient => {:only => :name}} )
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def index
    @ingredients = Ingredient.all
    @pantry_items = current_user.pantry_items_as_json
  end

  def destroy
      @user_ingredient = UserIngredient.find(params[:id])
      @user_ingredient.destroy
      head :no_content
  end

  private

  def user_ingredient_params
    params.require(:user_ingredients).permit(:amount,:unit,:ingredient_id)
  end

end
