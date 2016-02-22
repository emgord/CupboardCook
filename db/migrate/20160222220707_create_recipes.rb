class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :image
      t.string :directions
      t.string :yield
      t.string :time
      t.string :original_url
      t.string :description

      t.timestamps null: false
    end
  end
end
