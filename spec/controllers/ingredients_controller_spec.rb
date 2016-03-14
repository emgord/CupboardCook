require 'rails_helper'
require 'pry'

RSpec.describe IngredientsController, type: :controller do
  before :each do
    create(:recipe)
    Ingredient.reindex
    Ingredient.searchkick_index.refresh
  end

  context "user is logged out" do
    describe "GET #search" do
      it "is not successful and redirects" do
        get :search
        expect(response).to have_http_status(302)
      end
      it "redirects to the login page" do
        get :search
        expect(subject).to redirect_to login_path
      end
    end
  end

  context "user is logged in" do

    describe "GET #search" do

      before :each do
        @user = create(:user, :google)
        session[:user_id] = @user.id
        xhr :get, :search, {params: {:query => "apple"}, format: :json }
      end
      it "responds successfully with an HTTP 200 status code" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "returns json objects" do
        expect(response.header['Content-Type']).to include 'application/json'
      end
    end
  end
end
