class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :title, presence: true, length: { maximum: 150 }
  validates :yield, length: { maximum: 30 }
  validates :time, length: { maximum: 30 }
  validates :original_url, presence: true, uniqueness:true, length: {maximum: 250}
  validates :image, length: {maximum: 300}
  validates :description, length: {maximum: 2000}
  validates :uid, uniqueness:true, presence: true
  searchkick
  scope :search_import, -> { includes(:ingredients) }

  def search_data
    {
      title: title,
      description: description,
      has_description: description.present?,
      has_image: image.present?,
      ingredients: ingredients.name
    }
  end

  def self.search_recipes(recipe_id_array, query)
    Recipe.search(query,
                  where: {id: recipe_id_array},
                  operator: "or",
                  limit:50,
                  boost_where: {has_image: true, factor:10},
                  fields: [:ingredients, :title, :description],
                  include: :ingredients,
                  load: { Recipe =>{ :include => :ingredients},
                  })
  end

  def self.create_from_scrapy_seed(recipe_hash)
    if !recipe_hash["ingredients"].nil? && recipe_hash["ingredients"].length > 0
      recipe = Recipe.new
      recipe.title = recipe_hash["title"]
      recipe.uid = recipe_hash["uid"]
      recipe.original_url = "http://cooking.nytimes.com" + recipe_hash["original_url"] if !recipe_hash["original_url"].nil?
      recipe.time = recipe_hash["time"]
      recipe.yield = recipe_hash["recipe_yield"]
      recipe.image = recipe_hash["image"].slice(5,recipe_hash["image"].length) if !recipe_hash["image"].nil?
      recipe.description = recipe_hash["description"]
      if recipe.save
        recipe_hash["ingredients"].each do |ingredient|
          new_ingredient = Ingredient.find_or_create(ingredient)
          if !new_ingredient.nil? && !new_ingredient.exclude_ingredient? && !recipe.ingredients.include?(new_ingredient)
            recipe.ingredients << new_ingredient
          end
        end
        return recipe
      else
        return nil
      end
    else
      return nil
    end
  end

end
