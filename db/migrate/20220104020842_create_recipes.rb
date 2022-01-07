class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :meal
      t.integer :servings
      

      t.timestamps
    end
  end
end
