require 'rails_helper'
require 'pry'

RSpec.describe User, type: :model do
  let(:user) { build(:user, :google) }
  describe "validations" do
    it "is valid" do
      expect(user).to be_valid
    end
    it "requires an email" do
      user.email = nil
      expect(user).to be_invalid
    end

    it "requires a username" do
      user.username = nil
      expect(user).to be_invalid
    end

    it "requires a uid" do
      user.uid = nil
      expect(user).to be_invalid
    end

    it "requires a provider" do
      user.provider = nil
      expect(user).to be_invalid
    end
  end

  describe ".initialize_from_omniauth" do
    let(:user) { User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:google]) }

    it "creates a valid user" do
      expect(user).to be_valid
    end

    context "when it's invalid" do
      it "returns nil" do
        user = User.find_or_create_from_omniauth({"uid" => "123", "info" => {}})
        expect(user).to be_nil
      end
    end
  end

  describe ".find_recipes" do
    let(:user_with_all_ingred) {create(:user_with_all_ingred)}
    let(:user_missing_1_ingred) {create(:user_missing_1_ingred)}
    let(:user_missing_2_ingred) {create(:user_missing_2_ingred)}
    it "returns recipes you can make using ingredients in your pantry" do
      expect(user_with_all_ingred.find_recipes_as_json.count).to eq(1)
      expect(user_with_all_ingred.find_recipes_as_json[0]["id"]).to eq(Recipe.first.id)
    end
    it "returns nothing if you can't make any recipes" do
      expect(user_missing_1_ingred.find_recipes_as_json.count).to eq(0)
    end
    it "can specify to include recipes missing 1 ingredient" do
      expect(user_missing_1_ingred.find_recipes_as_json(1).count).to eq(1)
      expect(user_missing_1_ingred.find_recipes_as_json(1)[0]["id"]).to eq(Recipe.first.id)
    end
    it "can specify to include recipes missing 2 ingredients" do
      expect(user_missing_2_ingred.find_recipes_as_json(2).count).to eq(1)
      expect(user_missing_2_ingred.find_recipes_as_json(2)[0]["id"]).to eq(Recipe.first.id)
    end
    it "still returns the recipe even if you have all ingredients" do
      expect(user_with_all_ingred.find_recipes_as_json(1).count).to eq(1)
      expect(user_with_all_ingred.find_recipes_as_json(1)[0]["id"]).to eq(Recipe.first.id)
    end
  end
end
