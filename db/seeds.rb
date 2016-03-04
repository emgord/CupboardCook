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
  { name: "Beets"},
  { name: "Pine Nuts"},
  { name: "Lemon Juice"},
  { name: "Red Cabbage"},
  { name: "Green Cabbage"},
  { name: "Bacon"},
  { name: "Caraway Seeds"},
  { name: "Sugar"},
  { name: "Balsamic Vinegar"},
  { name: "White Vinegar"},
  { name: "Frozen Peas"},
  { name: "Tomato"},
  { name: "White Pepper"},
  { name: "Parsley"},
  { name: "Root Vegetables"},
  { name: "Cucumber"},
  { name: "Red Wine Vinegar"},
  { name: "Feta"},
  { name: "Mint"},
  { name: "Milk"}

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
  },
  { title: "Roasted Beets With Pine Nuts and Parmesan",
    time: "2 hours",
    original_url: "http://cooking.nytimes.com/recipes/1015269-roasted-beets-with-pine-nuts-and-parmesan"
  },
  { title: "Warm Red and Green Cabbage Slaw",
    yield: "Six side-dish servings",
    time: "45 minutes",
    original_url: "http://cooking.nytimes.com/recipes/4490-warm-red-and-green-cabbage-slaw"
  },
  { title: "Peas With Poached Eggs",
    image: "http://graphics8.nytimes.com/images/2014/04/09/dining/peaspoachedeggs/peaspoachedeggs-articleLarge.jpg",
    yield: "4 to 6 servings",
    time: "20 minutes",
    original_url: "http://cooking.nytimes.com/recipes/1012480-peas-with-poached-eggs"
  },
  { title: "Roasted Vegetables",
    image: "http://graphics8.nytimes.com/images/2015/09/23/dining/23ROASTEDVEGETABLES/23ROASTEDVEGETABLES-articleLarge.jpg",
    yield: "4 to 6 servings",
    time: "30 minutes to 1 hour",
    original_url: "http://cooking.nytimes.com/recipes/1017703-roasted-vegetables",
    description: "The key to roasting all kinds of vegetables is to know the right temperature for cooking them. Dense, low-moisture vegetables (like the roots and squashes in this recipe) need lower heat and more time in the oven than vegetables with more moisture, like eggplant or zucchini. Then simply toss your vegetables with oil and season with salt and pepper before roasting. Top your roasted vegetable with a couple of fried eggs or a dollop of yogurt, or both, and you have a meal."
  },
  { title: "Summer Salad with Feta",
    image: "http://graphics8.nytimes.com/images/2008/07/21/health/nutrition/21tomato.recipe.ready/21tomato.recipe.ready-articleLarge-v3.jpg",
    yield: "4 to 6 servings",
    time: "2 minutes",
    original_url: "http://cooking.nytimes.com/recipes/1016414-summer-salad-with-feta",
    description: "This is a modified Greek salad, one I tend to make pretty much nightly during the summer, when I always have these ingredients on hand."
  },
  { title: "Beet Greens Frittata",
    image: "http://graphics8.nytimes.com/images/2012/09/24/health/nutrition/24recipehealth-frittata/24recipehealth-frittata-articleLarge-v2.jpg",
    yield: "6 servings",
    time: "50 minutes",
    original_url: "http://cooking.nytimes.com/recipes/12778-beet-greens-frittata",
    description: "The New York City Greenmarket Web site has a handy table that shows what’s available during each month of the year. It tells me, for example, that fresh beets are available from June through November, but that you can count on the greens only through September. Use whatever color beet you choose for this recipes. The red ones will be higher in anthocyanins, the pigment-based phytonutrients that are believed to have strong antioxidant properties. But yellow and pink beets have a lot going for them nutritionally as well. All beets are rich in folates, potassium and the B-complex vitamins niacin, pantothenic acid and pyridoxine. This is one of the most versatile dishes you can make with beet greens. Cut the frittata into wedges and serve as a main dish or into smaller diamonds and serve as an hors d’oeuvre. It packs well in a lunchbox, too."
  }
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
  },
  { recipe_id:5,
    ingredient_id:22,
    original_string:"2 pounds beets"
  },
  { recipe_id:5,
    ingredient_id:23,
    original_string:"pine nuts"
  },
  { recipe_id:5,
    ingredient_id:9,
    original_string:"shaved Parmesan
"
  },
  { recipe_id:5,
    ingredient_id:24,
    original_string:"lemon juice"
  },
  { recipe_id:5,
    ingredient_id:2,
    original_string:"olive oil"
  },
  { recipe_id:6,
    ingredient_id:25,
    original_string:"½ head red cabbage"
  },
  { recipe_id:6,
    ingredient_id:26,
    original_string:"½ head green cabbage"
  },
  { recipe_id:6,
    ingredient_id:1,
    original_string:"Salt"
  },
  { recipe_id:6,
    ingredient_id:27,
    original_string:"3 slices bacon, diced"
  },
  { recipe_id:6,
    ingredient_id:28,
    original_string:"2 teaspoons caraway seeds
"
  },
  { recipe_id:6,
    ingredient_id:29,
    original_string:"2 teaspoons sugar
"
  },
  { recipe_id:6,
    ingredient_id:30,
    original_string:"2 tablespoons balsamic vinegar
"
  },
  { recipe_id:7,
    ingredient_id:27,
    original_string:"6 ounces thick-cut slab bacon, sliced crosswise into 1/4-inch pieces (see note)
"
  },
  { recipe_id:7,
    ingredient_id:18,
    original_string:"1 yellow onion, diced
"
  },
  { recipe_id:7,
    ingredient_id:18,
    original_string:"1 yellow onion, diced
"
  },
  { recipe_id:7,
    ingredient_id:31,
    original_string:"1 tablespoon white vinegar
"
  },
  { recipe_id:7,
    ingredient_id:21,
    original_string:"4 to 6 large eggs
"
  },
  { recipe_id:7,
    ingredient_id:32,
    original_string:"3 cups (about 1 pound) frozen baby peas, thawed
"
  },
  { recipe_id:7,
    ingredient_id:33,
    original_string:"1 medium tomato, seeded and diced
"
  },
  { recipe_id:7,
    ingredient_id:1,
    original_string:"Salt
"
  },
  { recipe_id:7,
    ingredient_id:35,
    original_string:"Ground white pepper
"
  },
  { recipe_id:7,
    ingredient_id:36,
    original_string:"1 tablespoon minced parsley, for garnish
"
  },
  { recipe_id:8,
    ingredient_id:37,
    original_string:"2 to 3 pounds root or dense vegetable, peeled if you like and cut into 1-inch chunks or wedges (carrots, beets, potatoes, sweet potatoes, turnips, radishes, rutabaga, winter squashes)
"
  },
  { recipe_id:8,
    ingredient_id:2,
    original_string:"Oil (olive, coconut or grapeseed)
"
  },
  { recipe_id:8,
    ingredient_id:1,
    original_string:"Oil (olive, coconut or grapeseed)
"
  },
  { recipe_id:8,
    ingredient_id:21,
    original_string:"Fried eggs and/or plain yogurt
"
  },
  { recipe_id:8,
    ingredient_id:36,
    original_string:"Fresh herbs, torn or chopped
"
  },
  { recipe_id:9,
    ingredient_id:33,
    original_string:"5 medium or large ripe tomatoes, cut into wedges, and if large, the wedges cut in half crosswise, or 1 pint cherry tomatoes, cut in half
"
  },
  { recipe_id:9,
    ingredient_id:37,
    original_string:"½ European cucumber, or 1 Persian or Japanese cucumber, cut in half lengthwise, seeded if desired, then sliced into half circles about 1/3 inch thick.
  "
    },
    { recipe_id:9,
      ingredient_id:1,
      original_string:"Sea salt or fleur de sel and freshly ground pepper
    "
      },
      { recipe_id:9,
        ingredient_id:38,
        original_string:"2 tablespoons red wine vinegar or sherry vinegar
      "
      },
      { recipe_id:9,
        ingredient_id:2,
        original_string:"¼ cup extra virgin olive oil
        "
        },
        { recipe_id:9,
          ingredient_id:2,
          original_string:"¼ cup extra virgin olive oil
          "
        },
        { recipe_id:9,
          ingredient_id:39,
          original_string:"½ cup crumbled feta
          "
        },
        { recipe_id:9,
          ingredient_id:40,
          original_string:"1 to 2 tablespoons chopped fresh mint, or 3/4 teaspoon dried oregano
          "
        },
        { recipe_id:10,
          ingredient_id:2,
          original_string:"2 tablespoons extra virgin olive oil"
        },
        { recipe_id:10,
          ingredient_id:22,
          original_string:"1 pound beet greens, stemmed and washed thoroughly"
        },
        { recipe_id:10,
          ingredient_id:3,
          original_string:"2 garlic cloves, minced"
        },
        { recipe_id:10,
          ingredient_id:21,
          original_string:"8 eggs"
        },
        { recipe_id:10,
          ingredient_id:1,
          original_string:"Salt and freshly ground pepper to taste"
        },
        { recipe_id:10,
          ingredient_id:41,
          original_string:"2 tablespoons milk"
        }
]
seed_recipe_ingredients.each do |seed|
  RecipeIngredient.create(seed)
end


seed_user_ingredients = [
  { user_id:1,
    ingredient_id:1
  },
  { user_id:1,
    ingredient_id:2
  },
  { user_id:1,
    ingredient_id:3
  },
  { user_id:1,
    ingredient_id:4
  },
  { user_id:1,
    ingredient_id:5
  },
  { user_id:1,
    ingredient_id:6
  },
  { user_id:1,
    ingredient_id:7
  },
  { user_id:1,
    ingredient_id:8
  },
  { user_id:1,
    ingredient_id:9
  },
  { user_id:1,
    ingredient_id:10
  }
]

# seed_user_ingredients.each do |seed|
#   UserIngredient.create(seed)
# end

(1..41).each do |seed|
  UserIngredient.create(user_id:1, ingredient_id:seed)
end

Recipe.update_ingredient_counts
