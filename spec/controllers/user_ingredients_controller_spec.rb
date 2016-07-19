require 'rails_helper'

RSpec.describe UserIngredientsController, type: :controller do
  let (:user_ingredient) do
    create(:user_ingredient)
  end

  let (:user) do
    user_ingredient.user
  end

  let (:good_params) do
      { ingredient_id: 4 }
  end

  let (:bad_params) do
    {ingredient_id: user_ingredient.ingredient_id }
  end

  context "user is logged out" do

    describe "POST #create" do
      it "is not successful and redirects" do
        post :create, good_params
        expect(response).to have_http_status(302)
      end
      it "redirects to the login page" do
        post :create, good_params
        expect(subject).to redirect_to login_path
      end
    end
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
    describe "DELETE #destroy" do
      it "is not successful and redirects" do
        delete :destroy, id: user_ingredient.id
        expect(response).to have_http_status(302)
      end
      it "redirects to the login page" do
        delete :destroy, id: user_ingredient.id
        expect(subject).to redirect_to login_path
      end
    end
  end

  context "user is logged in" do
    before :each do
      session[:user_id] = user.id
    end
    describe "POST #create" do
      it "creates a new user ingredient" do
        original_count = UserIngredient.all.count
        post :create, good_params
        expect(UserIngredient.all.count).to eq original_count + 1
      end
      it "returns a JSON representation of the new ingredient" do
        post :create, good_params
        expect(response.header['Content-Type']).to include 'application/json'
      end
      it "returns an error if the user_ingredient does not save" do
        post :create, bad_params
        expect(response).to have_http_status(422)
      end
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
    describe "DELETE #destroy" do
      it "deletes the user_ingredient" do
        delete :destroy, id: user_ingredient.id
        expect(UserIngredient.all).to_not include(user_ingredient)
      end
      it "does not allow user to delete another users ingredient" do
        another_users_ingredient = create(:user_ingredient)
        delete :destroy, id: another_users_ingredient.id
        expect(UserIngredient.all).to include(another_users_ingredient)
      end
    end

  end


end
