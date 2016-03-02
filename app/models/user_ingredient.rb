class UserIngredient < ActiveRecord::Base
  belongs_to :user
  belongs_to :ingredient
  validates :user_id, presence: true, uniqueness: { scope: :ingredient_id }
  validates :ingredient_id, presence: true, uniqueness: { scope: :user_id }
end
