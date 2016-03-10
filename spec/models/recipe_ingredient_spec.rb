require 'rails_helper'

RSpec.describe RecipeIngredient, type: :model do
  describe ".validates" do
    it "must have recipe_id and ingredient id" do
        recipe_ingredient = build(:recipe_ingredient)
        expect(recipe_ingredient).to be_valid
    end
    xit "must have a ingredient_id" do
      recipe_ingredient = build(:recipe_ingredient, ingredient_id: nil)
      expect(recipe_ingredient).to_not be_valid
    end
    xit "must have a recipe_id" do
      recipe_ingredient = build(:recipe_ingredient, recipe_id: nil)
      expect(recipe_ingredient).to_not be_valid
    end
  end
end
