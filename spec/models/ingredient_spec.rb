require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe ".validates" do
    it "must have a name" do
      expect(Ingredient.new(name: nil)).to_not be_valid
    end
    it "name must be unique" do
      Ingredient.create(name:"a")
      expect(Ingredient.new(name: "a")).to_not be_valid
    end
    it "name can have 40 characters" do
      expect(Ingredient.new(name: "a" * 40)).to be_valid
    end
    it "name cannot have 41 characters" do
      expect(Ingredient.new(name: "a" * 41)).to_not be_valid
    end
  end

  describe ".find_or_create" do
    let (:original_count) do
      Ingredient.all.count
    end
    it "creates an ingredient if it does not already exist" do
      count = original_count
      new_ingredient = Ingredient.find_or_create("tomato")
      expect(new_ingredient).to be_valid
      expect(Ingredient.all.count).to eq count + 1
    end
    it "downcases the ingredient name" do
      count = original_count
      new_ingredient = Ingredient.find_or_create("Tomato")
      expect(new_ingredient).to be_valid
      expect(Ingredient.all.length).to eq count + 1
      expect(new_ingredient.name).to eq "tomato"
    end
    it "matches if a singular version of the ingredient already exists" do
      create(:ingredient, name: "tomato")
      count = original_count
      new_ingredient = Ingredient.find_or_create('tomatoes')
      expect(new_ingredient).to be_valid
      expect(new_ingredient.name).to eq "tomato"
      expect(Ingredient.all.length).to eq count
    end
    it "matches if a plural version of the ingredient already exists" do
      create(:ingredient, name: "tomatoes")
      count = original_count
      new_ingredient = Ingredient.find_or_create('tomato')
      expect(new_ingredient).to be_valid
      expect(new_ingredient.name).to eq "tomatoes"
      expect(Ingredient.all.length).to eq count
    end
    it "does not create a new ingredient if it already exists" do
      Ingredient.find_or_create('tomato')
      count = original_count
      ingredient = Ingredient.find_or_create('Tomato')
      expect(ingredient).to be_valid
      expect(Ingredient.all.length).to eq count
    end
    it "returns nil if the ingredient is not valid and does not create an ingredient" do
      count = original_count
      ingredient = Ingredient.find_or_create("a" * 55)
      expect(ingredient).to eq nil
      expect(Ingredient.all.length).to eq count
    end
  end

  describe ".exclude_ingredient?" do
    let (:salt) do
      Ingredient.find_or_create("salt")
    end
    let (:pepper) do
      Ingredient.find_or_create("Pepper")
    end
    let (:saltnpepper) do
      Ingredient.find_or_create("salt and Pepper")
    end
    let (:tomato) do
      Ingredient.find_or_create("tomato")
    end
    let (:whitepepper) do
      Ingredient.find_or_create("white pepper")
    end
    let (:greenpepper) do
      Ingredient.find_or_create("Green Bell Pepper")
    end
    let (:water) do
      Ingredient.find_or_create("water")
    end
    it "returns true if the ingredient is salt" do
      expect(salt.exclude_ingredient?).to be_truthy
    end
    it "returns true if the ingredient is pepper" do
      expect(pepper.exclude_ingredient?).to be_truthy
    end
    it "returns true if the ingredient is salt and pepper" do
      expect(saltnpepper.exclude_ingredient?).to be_truthy
    end
    it "returns true if the ingredient is white pepper" do
      expect(whitepepper.exclude_ingredient?).to be_truthy
    end
    it "returns false if the ingredient is not pepper" do
      expect(tomato.exclude_ingredient?).to be_falsey
      expect(greenpepper.exclude_ingredient?).to be_falsey
    end
    it "returns true if the ingredient is water" do
      expect(water.exclude_ingredient?).to be_truthy
    end
  end
end
