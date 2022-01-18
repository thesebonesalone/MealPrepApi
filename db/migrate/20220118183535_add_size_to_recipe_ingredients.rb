class AddSizeToRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_ingredients, :size, :decimal
  end
end
