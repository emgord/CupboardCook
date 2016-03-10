class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  # after_save do
  #   update_column(:ingredient_count, self.ingredients.length)
  # end
  def self.create_from_scrapy_seed(recipe_hash)
    if recipe_hash["ingredients"].length > 0
      recipe = Recipe.new
      recipe.title = recipe_hash["title"]
      # r.uid = recipe["uid"]
      recipe.original_url = "http://cooking.nytimes.com" + recipe_hash["original_url"]
      recipe.time = recipe_hash["time"]
      recipe.yield = recipe_hash["recipe_yield"]
      recipe.image = recipe_hash["image"]
      recipe.description = recipe_hash["description"]
      if recipe.save
        recipe_hash["ingredients"].each do |ingredient|
          new_ingredient = Ingredient.find_or_create(ingredient)
          if !new_ingredient.nil?
            recipe.ingredients << new_ingredient
          end
        end
      end
    else
      return nil
    end
  end

end
