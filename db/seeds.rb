# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

seed_users = [
  { email: "emgord@gmail.com",
    username: "emgord",
    uid: "1223232",
    provider: "developer",
    image: "https://www.facebook.com/emily.gordon.35325"
  }
]

seed_users.each do |seed|
  User.create(seed)
end

seed_ingredients = [
  { name: "Salt"},
  { name: "Olive Oil"},
  { name: "Garlic"},
  { name: "Bread Crumbs"},
  { name: "Red Pepper Flakes"},
  { name: "Broccoli Rabe"},
  { name: "Spaghetti"},
  { name: "Pepper"},
  { name: "Parmasan Cheese"},
  { name: "Canola Oil"},
  { name: "Chili Powder"},
  { name: "Cumin"},
  { name: "Canned Black Beans"},
  { name: "Corn Tortilla"},
  { name: "Salsa"},
  { name: "Queso Fresco"},
  { name: "Cabbage"},
  { name: "Onion"},
  { name: "Green Bell Pepper"},
  { name: "Russet Potato"},
  { name: "Egg"},

]

seed_ingredients.each do |seed|
  Ingredient.create(seed)
end

seed_recipes = [
  { title: "Spaghetti With Broccoli Rabe, Toasted Garlic and Bread Crumbs",
    image: "http://graphics8.nytimes.com/images/2014/06/05/dining/Spaghetti-With-Broccoli-Rabe/Spaghetti-With-Broccoli-Rabe-articleLarge.jpg",
    yield: "4 to 6 servings",
    time: "20 to 30 minutes",
    original_url: "http://cooking.nytimes.com/recipes/1012419-spaghetti-with-broccoli-rabe-toasted-garlic-and-bread-crumbs",
    description: "Broccoli rabe can take whatever you throw at it and still shine. Its mild but distinctive bitterness dominates almost anything you cook it with — but what’s wrong with that? So a pasta sauce that features it teamed with garlic and chili flakes is a natural. Add bread crumbs for crunch and the dish is a real winner. You can use the same pot for cooking the broccoli and the pasta; you can use the same skillet for toasting the bread crumbs and finishing the dish. The whole thing will be done within 20 or 30 minutes, and it will showcase broccoli rabe beautifully, as it deserves."
  },
  { title: "Soft Black Bean Tacos With Salsa and Cabbage",
    image: "http://graphics8.nytimes.com/images/2014/03/21/dining/softbbtacos/softbbtacos-articleLarge.jpg",
    yield: "4 servings",
    time: "About 20 minutes",
    original_url: "http://cooking.nytimes.com/recipes/1014521-soft-black-bean-tacos-with-salsa-and-cabbage",
    description: "Canned black beans and lots of cabbage combine in a quick, utterly satisfying one-dish taco dinner. They can be served open-faced or folded over"
  },
  { title: "Tortilla Española",
    image: "http://graphics8.nytimes.com/images/2015/06/21/magazine/21eat1/21mag-21eat-t_CA0-articleLarge.jpg",
    yield: "8 - 12 servings",
    time: "1 hour",
    original_url: "http://cooking.nytimes.com/recipes/1017469-tortilla-espanola",
    description: "Perhaps the most Spanish of all tapas, this potato omelet makes a satisfying meal on its own; you can also serve it as a part of a spread with jamón, serrano, chorizo, cheese, olives and piquillo peppers. Poaching the potatoes and onions in olive oil makes them almost creamy. (Keep the infused oil in the fridge; it’s great for dipping bread or other uses.)"
  },
  { title: "Spaghetti With Fried Eggs",
    image: "http://graphics8.nytimes.com/images/2015/06/08/dining/08PASTAFRIEDEGG/08PASTAFRIEDEGG-articleLarge.jpg",
    yield: "2 or 3 servings",
    time: "20 minutes",
    original_url: "http://cooking.nytimes.com/recipes/8357-spaghetti-with-fried-eggs",
    description: "Here's a quick and delicious pasta dish to make when you have little time, and even less food in the house. All you need is a box of spaghetti, four eggs, olive oil and garlic (Parmesan is a delicious, but optional, addition)."
  }
  # { title: "",
  #   image: "",
  #   yield: "",
  #   time: "",
  #   original_url: "",
  #   description: ""
  # },
  # { title: "",
  #   image: "",
  #   yield: "",
  #   time: "",
  #   original_url: "",
  #   description: ""
  # },
  # { title: "",
  #   image: "",
  #   yield: "",
  #   time: "",
  #   original_url: "",
  #   description: ""
  # },
  # { title: "",
  #   image: "",
  #   yield: "",
  #   time: "",
  #   original_url: "",
  #   description: ""
  # },
  # { title: "",
  #   image: "",
  #   yield: "",
  #   time: "",
  #   original_url: "",
  #   description: ""
  # },
  # { title: "",
  #   image: "",
  #   yield: "",
  #   time: "",
  #   original_url: "",
  #   description: ""
  # },
  # { title: "",
  #   image: "",
  #   yield: "",
  #   time: "",
  #   original_url: "",
  #   description: ""
  # }
]

seed_recipes.each do |seed|
  Recipe.create(seed)
end


seed_recipe_ingredients = [
  { recipe_id:1,
    ingredient_id:1,
    original_string: "Salt"
  },
  { recipe_id:1,
    ingredient_id:2,
    quantity: "1/2",
    unit: "Cup",
    original_string: "½ cup extra virgin olive oil, more as needed"
  },
  { recipe_id:1,
    ingredient_id:3,
    quantity: "3 or 4",
    unit: "cloves",
    original_string: "3 or 4 cloves of garlic, peeled and slivered"
  },
  { recipe_id:1,
    ingredient_id:4,
    quantity: "1",
    unit: "cup",
    original_string: "1 cup bread crumbs, preferably homemade"
  },
  { recipe_id:1,
    ingredient_id:5,
    quantity: "1/4",
    unit:"teaspoon",
    original_string:"¼ teaspoon red pepper flakes, or to taste"
  },
  { recipe_id:1,
    ingredient_id:6,
    quantity: "1",
    unit:"pound",
    original_string:"About 1 pound broccoli rabe, trimmed and washed"
  },
  { recipe_id:1,
    ingredient_id:7,
    quantity:"1",
    unit:"pound",
    original_string:"1 pound spaghetti, linguine or other long pasta"
  },
  { recipe_id:1,
    ingredient_id:8,
    original_string: "Freshly ground black pepper"
  },
  { recipe_id:1,
    ingredient_id:9,
    original_string:"Freshly grated Parmesan cheese"
  },
  { recipe_id:2,
    ingredient_id:10,
    original_string:"1 tablespoon canola or grape seed oil"
  },
  { recipe_id:2,
    ingredient_id:11,
    original_string:"1 teaspoon medium-hot chili powder (more to taste)"
  },
  { recipe_id:2,
    ingredient_id:12,
    original_string:"1 teaspoon ground lightly toasted cumin seeds (more to taste)"
  },
  { recipe_id:2,
    ingredient_id:13,
    original_string:"2 cans black beans, with liquid"
  },
  { recipe_id:2,
    ingredient_id:1,
    original_string:"Salt to taste"
  },
  { recipe_id:2,
    ingredient_id:14,
    original_string:"8 corn tortillas"
  },
  { recipe_id:2,
    ingredient_id:15,
    original_string:"1 cup fresh or bottled salsa"
  },
  { recipe_id:2,
    ingredient_id:16,
    original_string:"3 ounces either queso fresco, feta, or sharp cheddar, grated or crumbled"
  },
  { recipe_id:2,
    ingredient_id:17,
    original_string:"2 cups shredded cabbage"
  },
  { recipe_id:3,
    ingredient_id:18,
    original_string:"1 ¼ pounds onions, diced"
  },
  { recipe_id:3,
    ingredient_id:19,
    original_string:"1 large green bell pepper, seeded and chopped"
  },
  { recipe_id:3,
    ingredient_id:3,
    original_string:"4 cloves garlic, minced"
  },
  { recipe_id:3,
    ingredient_id:20,
    original_string:"2 ½ pounds russet potatoes"
  },
  { recipe_id:3,
    ingredient_id:1,
    original_string:"Kosher salt, to taste"
  },
  { recipe_id:3,
    ingredient_id:2,
    original_string:"4 cups extra-virgin olive oil"
  },
  { recipe_id:3,
    ingredient_id:21,
    original_string:"10 large eggs"
  },
  { recipe_id:4,
    ingredient_id:1,
    original_string:"Salt"
  },
  { recipe_id:4,
    ingredient_id:7,
    original_string:"½ pound thin spaghetti"
  },
  { recipe_id:4,
    ingredient_id:2,
    original_string:"6 tablespoons extra virgin olive oil or lard"
  },
  { recipe_id:4,
    ingredient_id:3,
    original_string:"2 large cloves garlic, lightly smashed and peeled"
  },
  { recipe_id:4,
    ingredient_id:21,
    original_string:"4 eggs"
  },
  { recipe_id:4,
    ingredient_id:8,
    original_string:"Freshly ground black pepper"
  },
  { recipe_id:4,
    ingredient_id:9,
    original_string:"Freshly grated Parmesan or pecorino cheese, optional"
  }
]
seed_recipe_ingredients.each do |seed|
  RecipeIngredient.create(seed)
end


seed_user_ingredients = [
  { user_id:1,
    ingredient_id:2
  }
]

seed_user_ingredients.each do |seed|
  UserIngredient.create(seed)
end
