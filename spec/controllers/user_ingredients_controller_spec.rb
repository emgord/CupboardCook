require 'rails_helper'

RSpec.describe UserIngredientsController, type: :controller do

  context "user is logged out" do

  end

  context "user is logged in" do
    before :each do
      @user = create(:user, :google)
      session[:user_id] = @user.id
    end
  end


end
