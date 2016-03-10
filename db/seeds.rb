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

recipe_path= "#{Rails.root}/db/recipes10.json"
recipes = JSON.parse(File.read(recipe_path))

recipes.each do |recipe|
  Recipe.create_from_scrapy_seed(recipe)
end

(1..200).each do |seed|
  UserIngredient.create(user_id:1, ingredient_id:seed)
end
