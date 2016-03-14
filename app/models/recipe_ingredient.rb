class RecipeIngredient < ActiveRecord::Base
  belongs_to :ingredient, counter_cache: :recipes_count
  belongs_to :recipe
  # validates :recipe_id, presence: true
  # validates :ingredient_id, presence: true

  after_save do
    recipe = self.recipe
    recipe.ingredient_count = recipe.ingredients.length
    recipe.save
  end

end
