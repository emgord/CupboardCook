require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  context "user is logged out" do
    describe "GET #index" do
      it "is not successful and redirects" do
        get :index
        expect(response).to have_http_status(302)
      end
      it "redirects to the login page" do
        get :index
        expect(subject).to redirect_to login_path
      end
    end

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
    describe "GET #index" do
      it "responds successfully with an HTTP 200 status code" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end



    describe "POST #find_recipes" do
      let(:find_params) { {search_options: {:missing => 0, :heart => false}} }
      it "it successful" do
        post :find_recipes, find_params
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "returns json" do
        post :find_recipes, find_params
        expect(response.header['Content-Type']).to include 'application/json'
      end
    end
  end


end
