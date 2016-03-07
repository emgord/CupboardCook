class RecipeIngredient < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recipe

  after_save do
    recipe = self.recipe
    recipe.ingredient_count = recipe.ingredients.length
    recipe.save
  end

end
