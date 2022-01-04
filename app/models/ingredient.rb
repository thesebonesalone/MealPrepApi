class Ingredient < ApplicationRecord
    validates :name, presence: true
    validates :calories, presence: true
    validates :protein, presence: true
    validates :fat, presence: true
    validates :serving_size, presence: true
    validates :serving_type, presence: true
    has_many :recipes, :through => :recipe_ingredients
end