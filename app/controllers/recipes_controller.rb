class RecipesController < ApplicationController
  def index
    @recipes = current_user.find_recipes.as_json(:except => [:create_at, :updated_at],
                                                            :include => {:ingredients => {:only => [:name, :id]}} )
  end
end
