class recipe_ingredient < ApplicationRecord
    belongs_to: ingredient
    belongs_to: recipe
end