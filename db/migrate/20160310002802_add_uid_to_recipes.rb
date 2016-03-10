class AddUidToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :uid, :string
  end
end
