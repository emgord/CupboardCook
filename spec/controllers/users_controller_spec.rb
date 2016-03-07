require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  context "user is logged out" do
    describe "GET #find_recipes" do
      it "is not successful and redirects" do
        get :find_recipes
        expect(response).to have_http_status(302)
      end
      it "redirects to the login page" do
        get :find_recipes
        expect(subject).to redirect_to login_path
      end
    end
  end

  context "user is logged in" do
    before :each do
      @user = create(:user, :google)
      session[:user_id] = @user.id
    end
    describe "GET #find_recipes" do
      it "it successful" do
        get :find_recipes
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "returns json" do
        get :find_recipes
        expect(response.header['Content-Type']).to include 'application/json'
      end
    end
  end
end
