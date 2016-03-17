require 'rails_helper'

RSpec.describe UserRecipe, type: :model do
    describe ".validates" do
      it "must have user_id and recipe id" do
          user_recipe = build(:user_recipe)
          expect(user_recipe).to be_valid
      end
      it "must have a recipe_id" do
        user_recipe = build(:user_recipe, recipe_id: nil)
        expect(user_recipe).to_not be_valid
      end
      it "must have a user_id" do
        user_recipe = build(:user_recipe, user_id: nil)
        expect(user_recipe).to_not be_valid
      end
      it "user cannot have duplicate ingredients" do
        user_recipe = create(:user_recipe)
        second = UserRecipe.new(user_id: user_recipe.user_id, recipe_id: user_recipe.recipe_id)
        expect(second).to_not be_valid
      end
    end
end
