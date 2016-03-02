require 'rails_helper'
require 'pry'

RSpec.describe User, type: :model do
  let(:user) { build(:google_user) }
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
    it "returns recipes you can make using ingredients in your pantry" do
      user = create(:user_with_all_ingred)
      expect(user.find_recipes.count).to eq(1)
      expect(user.find_recipes[0]).to eq(Recipe.first)
    end
    it "returns nothing if you can't make any recipes" do
      user = create(:user_missing_ingreds)
      binding.pry
      expect(user.find_recipes.length).to eq(0)
    end
  end
end
