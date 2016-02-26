class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def update_ingredient_count
    self.ingredient_count = self.ingredients.length
    self.save
  end

  def self.update_ingredient_counts
    Recipe.all.each do |recipe|
      recipe.update_ingredient_count
    end
  end
end
