require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
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
  end
