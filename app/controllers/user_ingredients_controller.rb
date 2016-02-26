class UserIngredientsController < ApplicationController
  before_action :require_user

  def index
    @pantry_items = current_user.ingredients.all
  end

end
