class UserRecipesController < ApplicationController
  before_action :require_user

  def create
    @item = UserRecipe.new(user_recipe_params)
    @item.user_id = current_user.id
    if @item.save
      render json: @item.as_json(:except => [:create_at, :updated_at],
                                 :include => {:recipe => {:except=> [:create_at, :updated_at]}} )
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
      user_recipe = UserRecipe.find_by(recipe_id: params[:id], user_id: current_user.id)
      if user_recipe.user_id == current_user.id
        user_recipe.destroy
      end
      head :no_content
  end

  private

  def user_recipe_params
    params.require(:user_recipe).permit(:heart,:recipe_id)
  end

end
