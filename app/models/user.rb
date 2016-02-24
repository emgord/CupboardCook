class User < ActiveRecord::Base
  validates :email, :username, :uid, :provider, presence: true
  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients

  def self.find_or_create_from_omniauth(auth_hash)
    # Find or create a user
  end

  def self.create_from_omniauth(auth_hash)
    # Create a user
  end

end
