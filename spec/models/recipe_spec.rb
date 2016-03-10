require 'rails_helper'
require 'pry'

RSpec.describe Recipe, type: :model do


  describe ".validates" do
    it "must have a title" do
      recipe = build(:recipe, title: nil)
      expect(recipe).to_not be_valid
    end
    it "title can have 150 characters" do
      recipe = build(:recipe, title: "a"*150)
      expect(recipe).to be_valid
    end
    it "title cannot have 151 characters" do
      recipe = build(:recipe, title: "a"*151)
      expect(recipe).to_not be_valid
    end
    it "yield can have 30 characters" do
      recipe = build(:recipe, yield: "a"*30)
      expect(recipe).to be_valid
    end
    it "yield cannot have 31 characters" do
      recipe = build(:recipe, yield: "a"*31)
      expect(recipe).to_not be_valid
    end
    it "yield is not required" do
      recipe = build(:recipe, yield: nil)
      expect(recipe).to be_valid
    end
    it "time can have 30 characters" do
      recipe = build(:recipe, time: "a"*30)
      expect(recipe).to be_valid
    end
    it "time cannot have 31 characters" do
      recipe = build(:recipe, time: "a"*31)
      expect(recipe).to_not be_valid
    end
    it "time is not required" do
      recipe = build(:recipe, time: nil)
      expect(recipe).to be_valid
    end
      # validates :original_url, presence: true, uniqueness:true, length: {maximum: 250}
    it "original url must be present" do
      recipe = build(:recipe, original_url: nil)
      expect(recipe).to_not be_valid
    end
    it "original url must be unique" do
      first_recipe = create(:recipe)
      recipe = build(:recipe, original_url: first_recipe.original_url)
      expect(recipe).to_not be_valid
    end
    it "original url can have 250 characters" do
      recipe = build(:recipe, original_url: "a"*250)
      expect(recipe).to be_valid
    end
    it "original url cannot have 251 characters" do
      recipe = build(:recipe, original_url: "a"*251)
      expect(recipe).to_not be_valid
    end
    it "image can have 300 characters" do
      recipe = build(:recipe, image: "a"*300)
      expect(recipe).to be_valid
    end
    it "image cannot have 301 characters" do
      recipe = build(:recipe, image: "a"*301)
      expect(recipe).to_not be_valid
    end
    it "image is not required" do
      recipe = build(:recipe, image: nil)
      expect(recipe).to be_valid
    end
    it "description can have 2000 characters" do
      recipe = build(:recipe, description: "a"*2000)
      expect(recipe).to be_valid
    end
    it "description cannot have 2001 characters" do
      recipe = build(:recipe, description: "a"*2001)
      expect(recipe).to_not be_valid
    end
    it "description is not required" do
      recipe = build(:recipe, description: nil)
      expect(recipe).to be_valid
    end
    it "must have a uid" do
      recipe = build(:recipe, uid: nil)
      expect(recipe).to_not be_valid
    end
    it "uid must be unique" do
      recipe_1 = create(:recipe)
      recipe = build(:recipe, uid: recipe_1.uid)
      expect(recipe).to_not be_valid
    end
  end
end
