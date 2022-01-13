class Recipe < ApplicationRecord
    
    has_many :recipe_ingredients
    has_many :ingredients, :through => :recipe_ingredients
    has_many :instructions
    has_many :meals
    belongs_to :user
end