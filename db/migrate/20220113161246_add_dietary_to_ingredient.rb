class AddDietaryToIngredient < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :meat, :boolean
    add_column :ingredients, :fish, :boolean
    add_column :ingredients, :dairy, :boolean
    add_column :ingredients, :nonvegan, :boolean
    add_column :ingredients, :haram, :boolean
    add_column :ingredients, :trefah, :boolean
  end
end
