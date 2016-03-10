require 'json'

seed_users = [
  { email: "emgord@gmail.com",
    username: "Emily Gordon",
    uid: "118189904247005396156",
    provider: "google",
    image: "https://lh5.googleusercontent.com/-UFZ48ULhGhE/AAAAAAAAAAI/AAAAAAAAAAA/szBsj-p1MB0/photo.jpg"
  }
]

seed_users.each do |seed|
  User.create(seed)
end

recipe_path= "#{Rails.root}/db/test.json"
recipes = JSON.parse(File.read(recipe_path))

recipes.each do |recipe|
  if recipe["ingredients"].length > 0
    r = Recipe.new
    r.title = recipe["title"]
    # r.uid = recipe["uid"]
    r.original_url = "http://cooking.nytimes.com" + recipe["original_url"]
    r.time = recipe["time"]
    r.yield = recipe["recipe_yield"]
    r.image = recipe["image"]
    r.description = recipe["description"]
    if r.save
      recipe["ingredients"].each do |i|
        new_ingredient = Ingredient.find_or_create(i)
        r.ingredients << new_ingredient
      end
    end
  end
end

# seed_ingredients.each do |seed|
#   Ingredient.create(seed)
# end

#
# seed_recipes.each do |seed|
#   Recipe.create(seed)
# end


# seed_recipe_ingredients.each do |seed|
#   RecipeIngredient.create(seed)
# end


(1..41).each do |seed|
  UserIngredient.create(user_id:1, ingredient_id:seed)
end
