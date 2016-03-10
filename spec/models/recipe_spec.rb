require 'rails_helper'
require 'pry'

RSpec.describe Recipe, type: :model do
  # validates :title, presence: true, length: { maximum: 150 }
  # validates :yield, length: { maximum: 30 }
  # validates :time, length: { maximum: 30 }
  # validates :original_url, presence: true, uniqueness:true, length: {maximum: 250}
  # validates :image, length: {maximum: 300}
  # validates :description, length: {maximum: 2000}
  # validates :uid, uniqueness:true, presence: true
  # 
  # describe ".validates" do
  #   it "must have a title" do
  #     expect(Ingredient.new(name: nil)).to_not be_valid
  #   end
  #   it "name must be unique" do
  #     Ingredient.create(name:"a")
  #     expect(Ingredient.new(name: "a")).to_not be_valid
  #   end
  #   it "name can have 40 characters" do
  #     expect(Ingredient.new(name: "a" * 40)).to be_valid
  #   end
  #   it "name cannot have 41 characters" do
  #     expect(Ingredient.new(name: "a" * 41)).to_not be_valid
  #   end
  # end


end
