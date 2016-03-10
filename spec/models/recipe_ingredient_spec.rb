require 'rails_helper'

RSpec.describe RecipeIngredient, type: :model do
  describe ".validates" do
    it "must have recipe_id and ingredient id" do
        recipe_ingredient = build(:recipe_ingredient)
        expect(recipe_ingredient).to be_valid
    end
    it "must have a ingredient_id" do
      recipe_ingredient = build(:recipe_ingredient, ingredient_id: nil)
      expect(recipe_ingredient).to_not be_valid
    end
    it "must have a recipe_id" do
      recipe_ingredient = build(:recipe_ingredient, recipe_id: nil)
      expect(recipe_ingredient).to_not be_valid
    end
    it "recipe cannot have duplicate ingredients" do
      recipe_ingredient = create(:recipe_ingredient)
      second = RecipeIngredient.new(recipe_id: recipe_ingredient.recipe_id, ingredient_id: recipe_ingredient.ingredient_id)
      expect(second).to_not be_valid
    end
  end
end
