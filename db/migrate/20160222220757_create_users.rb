class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :uid
      t.string :provider
      t.string :image

      t.timestamps null: false
    end
  end
end
