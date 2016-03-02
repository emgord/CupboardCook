FactoryGirl.define do

  factory :ingredient do
    transient do
      owners []
    end
    sequence (:name) { |n| %w(salt canola oil tomato crab oatmeal egg milk granola bacon steak avocado cucumber)[n]}

    after(:create) do |ingredient, evaluator|
      if evaluator.owners.count > 0
        evaluator.owners.each do |owner|
          evaluator.users.push(owner)
        end
      end
    end
  end

  factory :google_user, class: User do
    username "Ada Lovelace"
    uid '123545'
    provider "google"
    email "a@b.com"
    image "https://lh5.googleusercontent.com/-UFZ48ULhGhE/AAAAAAAAAAI/AAAAAAAAAAA/szBsj-p1MB0/photo.jpg"

    trait :full_pantry do
      after(:create) {|google_user| google_user.ingredients << (Ingredient.find_by(name: "Salt") || create(:ingredient_1))}
      after(:create) {|google_user| google_user.ingredients << (Ingredient.find_by(name: "Egg") || create(:ingredient_2))}
      after(:create) {|google_user| google_user.ingredients << (Ingredient.find_by(name: "Tomato") || create(:ingredient_3))}
      after(:create) {|google_user| google_user.ingredients << (Ingredient.find_by(name: "Broccoli") || create(:ingredient_4))}
      after(:create) {|google_user| google_user.ingredients << (Ingredient.find_by(name: "Beans") || create(:ingredient_5))}
      after(:create) {|google_user| google_user.ingredients << (Ingredient.find_by(name: "Tortilla") || create(:ingredient_6))}
    end
  end

  factory :user do
    username "Ada Lovelace"
    uid '123545'
    provider "google"
    email "a@b.com"
    image "https://lh5.googleusercontent.com/-UFZ48ULhGhE/AAAAAAAAAAI/AAAAAAAAAAA/szBsj-p1MB0/photo.jpg"

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

  # factory :recipe_ingredient_1, class: RecipeIngredient do
  #   association :recipe
  #   association :ingredient, factory: :ingredient_1
  #   original_string "pinch of salt"
  # end
  #
  # factory :recipe_ingredient_2, class: RecipeIngredient do
  #   association :recipe
  #   association :ingredient, factory: :ingredient_2
  #   original_string "6 eggs"
  # end
  #
  # factory :recipe_ingredient_3, class: RecipeIngredient do
  #   association :recipe
  #   association :ingredient, factory: :ingredient_3
  #   original_string "medium tomato"
  # end
  #
  # factory :recipe_ingredient_4, class: RecipeIngredient do
  #   association :recipe
  #   association :ingredient, factory: :ingredient_4
  #   original_string "1 head broccoli"
  # end
  #
  # factory :recipe_ingredient_5, class: RecipeIngredient do
  #   association :recipe
  #   association :ingredient, factory: :ingredient_5
  #   original_string "1 can beans, drained"
  # end
  #
  # factory :recipe_ingredient_6, class: RecipeIngredient do
  #   association :recipe
  #   association :ingredient, factory: :ingredient_6
  #   original_string "7 medium corn tortillas"
  # end
  #
  factory :user_ingredient_1, class: UserIngredient do
    association :user, factory: :google_user
    association :ingredient, factory: :ingredient_1
    amount 1
    unit "cup"
  end
  #
  # factory :user_ingredient_2, class: UserIngredient do
  #   association :user, factory: :google_user
  #   association :ingredient, factory: :ingredient_2
  #   amount 1
  #   unit "cup"
  # end
  #
  # factory :user_ingredient_3, class: UserIngredient do
  #   association :user, factory: :google_user
  #   association :ingredient, factory: :ingredient_3
  #   amount 1
  #   unit "cup"
  # end
  #
  # factory :user_ingredient_4, class: UserIngredient do
  #   association :user, factory: :google_user
  #   association :ingredient, factory: :ingredient_4
  #   amount 1
  #   unit "cup"
  # end
  #
  # factory :user_ingredient_5, class: UserIngredient do
  #   association :user, factory: :google_user
  #   association :ingredient, factory: :ingredient_5
  #   amount 1
  #   unit "cup"
  # end
  #
  # factory :user_ingredient_6, class: UserIngredient do
  #   association :user, factory: :google_user
  #   association :ingredient, factory: :ingredient_6
  #   amount 1
  #   unit "cup"
  # end

end
