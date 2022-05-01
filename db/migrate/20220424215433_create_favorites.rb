class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.string "favoriteable_type"
      t.timestamps
    end
    add_index :favorites, [:restaurant_id, :user_id], unique: true
  end
end
