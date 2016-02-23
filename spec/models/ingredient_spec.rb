require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe ".validates" do
    it "must have a name" do
      expect(Ingredient.new(name: nil)).to_not be_valid
    end
  end
end
