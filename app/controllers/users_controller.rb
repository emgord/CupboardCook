class UsersController < ApplicationController
  before_action :require_user, except: [:health, :letsencrypt]

  def health
    render nothing: true
  end

  def letsencrypt
    render plain: ENV['LE_AUTH_RESPONSE']
  end

end
