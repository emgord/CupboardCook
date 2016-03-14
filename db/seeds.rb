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

recipe_path= "#{Rails.root}/db/seeds/"
files = ["recipes10.json", "recipes442.json", "recipes1101.json", "recipes1217.json", "recipes6027.json", "recipes10234.json", "recipes1012300.json", "recipes1013880.json", "recipes1016165.json"]
files.each do |file|
  recipes = JSON.parse(File.read(recipe_path + file))
  recipes.each do |recipe|
    Recipe.create_from_scrapy_seed(recipe)
  end
end

(1..100).each do |seed|
  UserIngredient.create(user_id:1, ingredient_id:seed)
end

(400..500).each do |seed|
  UserIngredient.create(user_id:1, ingredient_id:seed)
end
