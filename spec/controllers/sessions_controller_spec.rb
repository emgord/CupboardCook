require 'rails_helper'
require 'pry'

RSpec.describe SessionsController, type: :controller do

  context "user is logged out" do
    describe "GET #new" do
      it "responds successfully with an HTTP 200 status code" do
        get :new
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "renders the new template" do
        get :new
        expect(response).to render_template :new
      end
    end
    describe "GET #create" do
        context "when using google authorization" do
          context "is successful" do
            before { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google] }

            it "redirects to home page" do
              get :create, provider: :google
              expect(response).to redirect_to root_path
            end

            it "creates a user" do
              expect { get :create, provider: :google }.to change(User, :count).by(1)
            end

            it "assigns the @user var" do
              get :create, provider: :google
              expect(assigns(:user)).to be_an_instance_of User
            end

            it "assigns the session[:user_id]" do
              get :create, provider: :google
              expect(session[:user_id]).to eq assigns(:user).id
            end

          end

          context "when the user has already signed up" do
            before { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google] }
            let!(:user) { User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:google]) }

            it "doesn't create another user" do
              expect { get :create, provider: :google }.to change(User, :count).by(0)
            end

            it "assigns the session[:user_id]" do
              get :create, provider: :google
              expect(session[:user_id]).to eq user.id
            end
          end

          context "fails on google" do
            before { request.env["omniauth.auth"] = :invalid_credential }

            it "redirect to home with flash error" do
              get :create, provider: :google
              expect(response).to redirect_to root_path
              expect(flash[:notice]).to include "Incorrect email or password"
            end
          end

          context "when failing to save the user" do
            before {
              request.env["omniauth.auth"] = {"uid" => "1234", "info" => {}}
            }

            it "redirect to home with flash error" do
              get :create, provider: :google
              expect(response).to redirect_to root_path
              expect(flash[:notice]).to include "Incorrect email or password"
            end
          end
        end
      end

      describe "DELETE #destroy" do
        it "is not successful and redirects" do
          delete :destroy
          expect(response).to redirect_to root_path
        end
        it "redirects to the root path" do
          delete :destroy
          expect(subject).to redirect_to root_path
        end
      end

    end

    context "user is logged in" do
      before :each do
        @user = create(:google_user)
        session[:user_id] = @user.id
      end
      describe "GET #new" do
        it "is not successful and redirects" do
          get :new
          expect(response).to have_http_status(302)
        end
        it "redirects to the root path" do
          get :new
          expect(subject).to redirect_to root_path
        end
      end
      describe "POST #create" do
        before { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google] }
        it "redirects to root path" do
          get :create, provider: :google
          expect(subject).to redirect_to root_path
        end
      end
      describe "DELETE #destroy" do
        it "redirects to index page" do
          delete :destroy
          expect(response).to redirect_to root_path
        end
      end

    end
  end
