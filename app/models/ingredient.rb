class Ingredient < ActiveRecord::Base
  has_many :user_ingredients
  has_many :users, through: :user_ingredients
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  validates :name, presence: true

end
