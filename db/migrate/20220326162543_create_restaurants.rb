class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.integer :splitVote
      t.integer :noSplitVote

      t.timestamps
    end
  end
end
