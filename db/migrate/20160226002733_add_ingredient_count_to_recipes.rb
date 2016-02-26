class AddIngredientCountToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :ingredient_count, :integer
  end
end
