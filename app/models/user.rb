class User < ActiveRecord::Base
  validates :email, :username, :uid, :provider, presence: true
  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients

  def self.find_or_create_from_omniauth(auth_hash)
    user = self.find_by(uid: auth_hash["uid"], provider: auth_hash["provider"])
    if !user.nil?
      return user
    elsif auth_hash["provider"] == "google"
      user            = User.new
      user.uid        = auth_hash["uid"]
      user.provider   = auth_hash["provider"]
      user.username   = auth_hash["info"]["name"]
      user.email      = auth_hash["info"]["email"]
      user.image      = auth_hash["info"]["image"]
      if user.save
        return user
      else
        return nil
      end
    end
  end

  #returns a hash with the recipe id key mapping to the number of ingredients you have for the recipe
  def find_recipe_hash(missing)
    pantry_names = self.ingredients.map do |i|
      i = i.name
    end
    recipe_hash = Recipe.select("recipes.id").joins(:ingredients).where(ingredients: {name: pantry_names}).group("recipes.id").having('COUNT(*) >= recipes.ingredient_count - ?', missing).count
    return recipe_hash
  end

  def find_recipes(missing = 0)
    recipe_hash = self.find_recipe_hash(missing)
    recipe_id_array = recipe_hash.keys
    user_recipes = Recipe.where(id: recipe_id_array)
    return user_recipes
  end

  def pantry_items_as_json
    self.user_ingredients.eager_load(:ingredient).as_json(:except => [:create_at, :updated_at],
                                                          :include => {:ingredient => {:only => :name}} )
  end

  def find_recipes_as_json
    self.find_recipes.eager_load(:ingredients).as_json(:except => [:create_at, :updated_at],
                                                       :include => {:ingredients => {:only => [:name, :id]}} )
  end

end
