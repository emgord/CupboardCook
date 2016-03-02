FactoryGirl.define do

  factory :ingredient do
    transient do
      owners []
    end
    sequence (:name) { |n| "Ingredient#{n}"}

    after(:create) do |ingredient, evaluator|
      if evaluator.owners.count > 0
        evaluator.owners.each do |owner|
          evaluator.users.push(owner)
        end
      end
    end
  end

  factory :user do
    username "Ada Lovelace"
    uid '123545'
    provider "test"
    email "a@b.com"
    image "https://lh5.googleusercontent.com/-UFZ48ULhGhE/AAAAAAAAAAI/AAAAAAAAAAA/szBsj-p1MB0/photo.jpg"

    trait :google do
      provider "google"
    end

    factory :user_with_all_ingred do
      transient do
        ingredient_count 6
      end
      after(:create)do |user, evaluator|
        create_list(:ingredient, evaluator.ingredient_count, owners:[user])
        create_list(:recipe, 1, ingredient_list: evaluator.ingredients)
      end

      factory :user_missing_ingreds do
        after(:create) do |user,evaluator|
          evaluator.ingredients.last.destroy
        end
      end
    end
  end

  factory :recipe do
    title "Bean Tacos"
    image "www.tacoimage.com"
    time "30 minutes"
    original_url "www.taco.com"
    description "A delicious easy meal"
    ingredient_count 6
    transient do
      ingredient_list []
    end
    after(:create) do |recipe, evaluator|
      if evaluator.ingredient_list.count > 0
        evaluator.ingredient_list.each do |i|
          evaluator.ingredients.push(i)
        end
      else
        create_list(:ingredient, evaluator.ingredient_count, recipes: [recipe])
      end
    end
  end

  factory :recipe_ingredient, class: RecipeIngredient do
    association :recipe
    association :ingredient
    original_string "pinch of salt"
  end

  factory :user_ingredient, class: UserIngredient do
    association :user
    association :ingredient
    amount 1
    unit "cup"
  end

end
