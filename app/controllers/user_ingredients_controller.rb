class UserIngredientsController < ApplicationController
  before_action :require_user

  def create


  end

  def index
    @item = UserIngredient.new
    @pantry_items = current_user.ingredients.all
  end

  private


end
