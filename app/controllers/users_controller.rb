class UsersController < ApplicationController
  before_action :require_user, except: [:health, :letsencrypt]

  def health
    render nothing: true
  end

  def letsencrypt
    render plain: ENV['LE_AUTH_RESPONSE']
  end

  def populate_pantry
    current_user.populate_pantry
    render json: current_user.pantry_items_as_json
  end

  def clear_pantry
    current_user.clear_pantry
    render json: current_user.pantry_items_as_json
  end

end
