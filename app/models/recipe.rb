class Recipe < ApplicationRecord
    validates :name, presence: true
    validates :meal, presence: true
    has_many :recipe_ingredients
    has_many :ingredients, :through => :recipe_ingredients
    has_many :instructions
end