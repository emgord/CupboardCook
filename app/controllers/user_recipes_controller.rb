class UserRecipesController < ApplicationController
  before_action :require_user

  def create
    @item = UserRecipe.new(user_recipe_params)
    @item.user_id = current_user.id
    @item.heart = false if user_recipe_params[:heart].nil?
    @item.cooked = false if user_recipe_params[:cooked].nil?
    if @item.save
      render json: @item.as_json(:except => [:create_at, :updated_at],
                                 :include => {:recipe => {:except=> [:create_at, :updated_at]}} )
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def index
    render json: @user_recipes = current_user.recipes ### as JSON .recipes.where(user_recipes: {heart: true}).
  end

  def destroy
      user_recipe = UserRecipe.find(params[:id])
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
