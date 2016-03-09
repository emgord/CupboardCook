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
    it "creates an ingredient if it does not already exist" do
      new_ingredient = Ingredient.find_or_create("tomato")
      expect(new_ingredient).to be_valid
      expect(Ingredient.all.length).to eq 1
    end
    it "downcases the ingredient name" do
      new_ingredient = Ingredient.find_or_create("Tomato")
      expect(new_ingredient).to be_valid
      expect(Ingredient.all.length).to eq 1
      expect(new_ingredient.name).to eq "tomato"
    end
    it "finds and returns the ingredient if it already exists" do
      Ingredient.find_or_create('tomato')
      ingredient = Ingredient.find_or_create('Tomato')
      expect(ingredient).to be_valid
      expect(Ingredient.all.length).to eq 1
    end
    it "returns nil if the ingredient is not valid" do
      ingredient = Ingredient.find_or_create("a" * 55)
      expect(ingredient).to eq nil
      expect(Ingredient.all.length).to eq 0
    end
  end
end
