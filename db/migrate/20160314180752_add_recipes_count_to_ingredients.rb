class AddRecipesCountToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :recipes_count, :integer
  end
end
