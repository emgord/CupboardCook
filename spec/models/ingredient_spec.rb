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
      new_ingredient = Ingredient.find_or_create("tomato")
      expect(new_ingredient).to be_valid
      expect(Ingredient.all.count).to eq original_count
    end
    it "downcases the ingredient name" do
      original_count = Ingredient.all.count
      new_ingredient = Ingredient.find_or_create("Tomato")
      expect(new_ingredient).to be_valid
      expect(Ingredient.all.length).to eq original_count
      expect(new_ingredient.name).to eq "tomato"
    end
    it "finds and returns the ingredient if it already exists" do
      Ingredient.find_or_create('tomato')
      ingredient = Ingredient.find_or_create('Tomato')
      expect(ingredient).to be_valid
      expect(Ingredient.all.length).to eq original_count
    end
    it "returns nil if the ingredient is not valid" do
      ingredient = Ingredient.find_or_create("a" * 55)
      expect(ingredient).to eq nil
      expect(Ingredient.all.length).to eq original_count
    end
  end

  describe ".salt_or_pepper?" do
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
    it "returns true if the ingredient is salt" do
      expect(salt.salt_or_pepper?).to be_truthy
    end
    it "returns true if the ingredient is pepper" do
      expect(pepper.salt_or_pepper?).to be_truthy
    end
    it "returns true if the ingredient is salt and pepper" do
      expect(saltnpepper.salt_or_pepper?).to be_truthy
    end
    it "returns true if the ingredient is white pepper" do
      expect(whitepepper.salt_or_pepper?).to be_truthy
    end
    it "returns false if the ingredient is not pepper" do
      expect(tomato.salt_or_pepper?).to be_falsey
      expect(greenpepper.salt_or_pepper?).to be_falsey
    end
  end
end
