class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.string :quantity
      t.string :unit
      t.string :original_string

      t.timestamps null: false
    end
  end
end
