class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :brand
      t.integer :calories
      t.integer :protein
      t.integer :carbs
      t.integer :fat
      t.decimal :serving_size
      t.boolean :serving_type

      t.timestamps
    end
  end
end
