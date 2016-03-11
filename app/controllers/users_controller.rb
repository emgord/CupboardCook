class UsersController < ApplicationController
  before_action :require_user, except: [:health]

  def find_recipes
    render json: current_user.find_recipes_as_json
  end

  def health
    render nothing: true
  end

  def letsencrypt
    render plain: ENV['LE_AUTH_RESPONSE']
  end

end
