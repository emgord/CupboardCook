require 'rails_helper'
require 'pry'

RSpec.describe UserIngredient, type: :model do
  describe ".validates" do
    it "must have user_id and ingredient id" do
        user_ingredient = build(:user_ingredient_1)
        expect(user_ingredient).to be_valid
    end
    it "must have a ingredient_id" do
      user_ingredient = build(:user_ingredient_1, ingredient_id: nil)
      expect(user_ingredient).to_not be_valid
    end
    it "must have a user_id" do
      user_ingredient = build(:user_ingredient_1, user_id: nil)
      expect(user_ingredient).to_not be_valid
    end
    it "user cannot have duplicate ingredients" do
      user_ingredient = create(:user_ingredient_1)
      second = UserIngredient.new(user_id: user_ingredient.user_id, ingredient_id: user_ingredient.ingredient_id)
      expect(second).to_not be_valid
    end
  end
end
