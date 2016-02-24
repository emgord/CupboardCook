require 'rails_helper'
require 'pry'

RSpec.describe Recipe, type: :model do

  describe "find recipes" do
    let(:user) {create(:google_user)}
    let(:full_pantry) {create(:google_user, :full_pantry)}
    let(:recipe) {create(:recipe)}
    it "lets me investigate with pry" do
      binding.pry
    end
  end

end
