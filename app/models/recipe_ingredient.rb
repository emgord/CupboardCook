class RecipeIngredient < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recipe
  validates :recipe_id, presence: true, uniqueness: { scope: :ingredient_id }
  validates :ingredient_id, presence: true, uniqueness: { scope: :recipe_id }

  after_save do
    recipe = self.recipe
    recipe.ingredient_count = recipe.ingredients.length
    recipe.save
  end

end
