class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  after_save do
    update_column(:ingredient_count, self.ingredients.length)
  end

end
