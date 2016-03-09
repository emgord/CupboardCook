class Ingredient < ActiveRecord::Base
  has_many :user_ingredients
  has_many :users, through: :user_ingredients
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  validates :name, presence: true, uniqueness: true, length: { maximum: 40 }
  searchkick

  def self.find_or_create(ingredient_name_string)
    ingredient_name_string.downcase!
    ingredient = self.find_by(name: ingredient_name_string)
    if !ingredient.nil?
      return ingredient
    else
      ingredient = Ingredient.new(name: ingredient_name_string)
      if ingredient.save
        return ingredient
      else
        return nil
      end
    end
  end
end
